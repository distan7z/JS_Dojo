class SubmissionsController < ApplicationController

  def new
    # needs upstream data from Exercices controller (is what's next OK?)
    @exercice = Exercice.find(params[:exercice_id])
    @submission = Submission.new
  end

  def create
    @submission = Submission.new
    @user_code = params[:submission][:user_code]
    @exercice = Exercice.find(params[:exercice_id])
    @solution = @exercice.solution
    if @user_code == @solution
      puts "\n*****user_code equals solution*****\n"
      #@submission = Submission.new(submission_params)
      redirect_to submission_path(:show)
    else
      puts "\n*****user_code NOT equals solution*****\n"
      render :new
    end
  end

  def show
  end

  private

  def submission_params
    return params.permit(:submission).require(:user_code) #created_at etc?
  end

end
