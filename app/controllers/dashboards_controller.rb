class DashboardsController < ApplicationController
  def show
    @unfinished_exercices = Submission.where(user: current_user, validation: false)
    @total_wins = User.find(current_user.id).submissions.where(validation: true).count
    @never_tried = Exercice.excluding(current_user.exercices)
  end
end
