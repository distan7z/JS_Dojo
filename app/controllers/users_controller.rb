class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @finished_exercices = Submission.where(user: current_user, validation: true)
  end
end
