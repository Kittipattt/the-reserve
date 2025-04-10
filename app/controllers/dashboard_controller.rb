class DashboardController < ApplicationController
  before_action :authenticate_user!  # Ensures user is logged in

  def index
    # Logic for the dashboard goes here
  end
end
