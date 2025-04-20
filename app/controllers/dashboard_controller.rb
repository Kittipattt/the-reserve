class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all
    @upcoming_reservations = current_user.reservations.includes(:room)
                                          .where("start_time >= ?", Time.zone.now)
                                          .order(:start_time)
  end

  def reserve
    @room = Room.find(params[:id])

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
