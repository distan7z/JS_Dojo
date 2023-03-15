require "execjs"

class SubmissionsController < ApplicationController

  def new
    @exercice = Exercice.find(params[:exercice_id])
    @submission = Submission.new

    @output = "No output 🧐 Run your JavaScript code!"
    @current_error = "No errors (yet 🥲)"
  end

  def create
    @user_code = params[:submission][:user_code]
    @exercice = Exercice.find(params[:exercice_id])
    @solution = @exercice.solution

    @submission = Submission.new(submission_params)

    @submission.user_id = current_user.id
    @submission.exercice_id = @exercice.id
    @submission.attempts_count = 0
    @submission.validation = false

    puts "Errors:\n"
    puts @submission.errors.full_messages

    if @submission.save
      puts "Submission successfully saved!\n Redirecting to edit_exercice path"
      @submission.validation = false
      redirect_to edit_exercice_submission_path(@exercice, @submission) # pour éviter de réécrire la validation dans create ET edit
    else
      puts "Submission not saved!\n Redirecting to new_exercice path"
      redirect_to new_exercice_submission_path(@exercice)
    end
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def edit
    @submission = Submission.find(params[:id])
    @exercice = Exercice.find(@submission.exercice_id)

    @submission.attempts_count.zero? ? @current_error = "No errors (yet 🥲)" : @current_error = "(No errors)"

    begin
      @rakes = JSON.parse(@exercice.testing_code)
    rescue JSON::ParserError => e
      puts "Parse Error. Is there an available rake for the current exercice?"
      render :edit
    end

    puts "Begin evaluating JS..."

    @rakes_insights = []
    @exercice_validations = 0

    @rakes.each do |unit_test|
      puts "unit test n°#{@rakes.find_index(unit_test)}"
      begin
        context = MiniRacer::Context.new
        # debugger
        to_be_evaluated = @submission.user_code + "\n" + unit_test["input"]
        executed = context.eval(to_be_evaluated)
        round_validation = executed == unit_test["expected-output"]
      rescue StandardError => e
        @current_error = e
        p "Error: #{e}"
      end
      rake_insight = {
                        to_be_evaluated: to_be_evaluated,
                        executed: executed,
                        unit_test: unit_test,
                        round_validation: round_validation
                      }
      @rakes_insights << rake_insight
      @exercice_validations += 1 if round_validation
    end

    puts "... end evaluating JS"

    @submission.attempts_count += 1
    @submission.validation = @rakes.length == @exercice_validations
    @submission.save

    if @submission.validation == true
      user = @submission.user
      user.exp += @submission.exercice.exp
      user.save
      redirect_to submission_path(@submission)
    else
      render :edit
    end
  end

  def update
    @submission = Submission.find(params[:id])
    @exercice = Exercice.find(@submission.exercice_id)
    @submission.user_code = submission_params[:user_code]
    if @submission.save
      puts "Submission successfully updated!\n Redirecting to edit_exercice path"
      redirect_to edit_exercice_submission_path(@exercice, @submission)
    else
      puts "Submission not updated!\n Redirecting to new_exercice path"
      redirect_to edit_exercice_submission_path(@exercice)
    end
  end

  private

  def submission_params
    return params.require(:submission).permit(:user_code) #created_at etc?
  end
end
