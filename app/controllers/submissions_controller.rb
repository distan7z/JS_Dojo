class SubmissionsController < ApplicationController

  def new
    # needs upstream data from Exercices controller (is what's next OK?)
    @exercice = Exercice.find(params[:exercice_id])
    @user_attempt = ""
  end

  def create
  end

  def show
  end

end
