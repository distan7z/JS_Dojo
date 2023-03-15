class ExercicesController < ApplicationController
  before_action :authenticate_user!, only: :toggle_favorite

  def toggle_favorite
    @exercice = Exercice.find_by(id: params[:id])
    current_user.favorited?(@exercice) ? current_user.unfavorite(@exercice) : current_user.favorite(@exercice)
  end

  def index
    if params[:query]
      @exercices = Exercice.includes(:tags).where(tags:{title:params[:query]})
    else
      @exercices = Exercice.all
    end
  end

  def show
    @exercice = Exercice.find(params[:id])
  end

  private

  def exercice_params
    params.require(:exercice).permit(:title, :details, :exp)
  end

end
