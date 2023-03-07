class SubmissionsController < ApplicationController

  def new
    # needs upstream data from Exercices controller
    @exercice = Exercice.find(params[:exercice_id])
  end

  def create
  end

  def show
  end

end
