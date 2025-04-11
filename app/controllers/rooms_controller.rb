class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :reserve]

  def index
    @rooms = Room.all # Fetch all rooms from the database
  end

  def show
    @room = Room.find(params[:id])
  end

  # Other actions like show, index, etc.

  def reserve
    # The room is already set via the before_action
    # You can create a new reservation object here if necessary
    @reservation = Reservation.new(room: @room)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
