class UsersController < ApplicationController
  def index
     @users = User.order("exp DESC NULLS LAST")
                #  .select('users.*, SUM(COALESCE(submissions.exp, 0)) + users.exp AS total_exp')
                #  .where(submissions: {validation: true})
                #  .group('users.id')
                #  .order('total_exp DESC')
  end

  def show
    @user = User.find(params[:id])
    @submissions = @user.submissions.validated.includes(:exercice)
    @total_exp = @submissions.sum(&:exp) + @user.exp
  end
end
