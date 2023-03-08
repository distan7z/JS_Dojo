class SubmissionsController < ApplicationController

  def new
    # needs upstream data from Exercices controller (is what's next OK?)
    @exercice = Exercice.find(params[:exercice_id])
    @submission = Submission.new
  end

  def create
    @user_code = params[:submission][:user_code]
    @exercice = Exercice.find(params[:exercice_id])
    @solution = @exercice.solution

    @submission = Submission.new(submission_params)

    @submission.user_id = current_user.id
    @submission.exercice_id = @exercice.id

    puts "Errors:\n"
    puts @submission.errors.full_messages

    puts "_____________________________________________________________________"

    if @submission.save
      puts "Submission successfully saved!\n Redirecting to edit_exercice path"
      redirect_to edit_exercice_submission_path(@exercice, @submission) # pour éviter de réécrire la validation dans create ET edit
    else
      puts "Submission not saved!\n Redirecting to new_exercice path"
      redirect_to new_exercice_submission_path(@exercice)
    end
    puts "_____________________________________________________________________\n"
  end

  def show
  end

  def edit
    @submission = Submission.find(params[:id])
    @exercice = Exercice.find(@submission.exercice_id)
    puts "_____________________________________________________________________"
    if @submission.user_code == @exercice.solution
      puts "\n*****user_code equals solution*****\n"
      redirect_to submission_path(:show)
    else
      puts "\n*****user_code NOT equals solution*****\n"
      render :edit
    end
    puts "_____________________________________________________________________\n"
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
    puts "_____________________________________________________________________\n"
  end

  private

  def submission_params
    return params.require(:submission).permit(:user_code) #created_at etc?
  end

end
