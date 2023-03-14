class DashboardsController < ApplicationController
  def show
    @unfinished_submissions = Submission.where(user: current_user, validation: false)
    @last_unfinished_submission = @unfinished_submissions&.last
    @total_wins = User.find(current_user.id).submissions.where(validation: true).count
    @never_tried = Exercice.excluding(current_user.exercices)
  end
end
