class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_logged_in?
      redirect_to dashboards_path
    end
  end
end
