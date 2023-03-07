class ExercicesController < ApplicationController
  def index
    @exercices = Exercice.all
  end

  def show
    @exercice = Exercice.find(params[:id])
  end

  private

  def exercice_params
    params.require(:exercice).permit(:title, :details, :exp)
  end

end
