class DashboardController < ApplicationController
  before_action :authenticate_user!  # Ensures user is logged in
  def index
    @rooms = Room.all
    # Ensure we're using `>=` for upcoming reservations and Time.zone.now
    @upcoming_reservations = current_user.reservations.includes(:room)
                                          .where("start_time >= ?", Time.zone.now)
                                          .order(:start_time)
  end

  def reserve
    @room = Room.find(params[:id])

    # Reservation logic (you can add more functionality here later)
    if request.post?
      reservation = Reservation.create(
        user: current_user,
        room: @room,
        check_in: params[:check_in],
        check_out: params[:check_out]
      )
      flash[:notice] = "Reservation successful!"
      redirect_to dashboard_path
    end
  end
end
