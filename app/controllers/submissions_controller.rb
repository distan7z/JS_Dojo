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

    @attempts_count && attempts_count.positive? ? @current_error = "(No errors)" : @current_error = "No errors (yet 🥲)"

    @rakes = JSON.parse(@exercice.testing_code)

    puts "Begin evaluating JS..."

    @rakes.each do |unit_test|
      puts "unit test n°#{@rakes.find_index(unit_test)}"
      begin
        context = MiniRacer::Context.new
        to_be_evaluated = @submission.user_code + "\n" + unit_test["input"]
        @executed = context.eval(to_be_evaluated)
        puts "to be evaluated: #{to_be_evaluated}\n@executed: #{@executed}\nunit_test['exepected-output']#{unit_test["expected-output"]}\n   ***   "
        @submission.validation = @executed == unit_test["expected-output"]
      rescue StandardError => e
        @current_error = e
        p "Error: #{e}"
      end
    end

    puts "... end evaluating JS"

    @submission.attempts_count += 1
    @submission.save

    if @submission.validation
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
