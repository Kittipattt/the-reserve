class DashboardController < ApplicationController
  before_action :authenticate_user!  # Ensures user is logged in

  def index
    @rooms = Room.all
  end

  def reserve
    @room = Room.find(params[:id])
    # Add logic to handle the reservation here
  end
end
