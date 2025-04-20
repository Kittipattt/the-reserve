class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :reserve]

  def index
    @rooms = Room.all 
  end

  def show
    @room = Room.find(params[:id])
  end


  def reserve
    @reservation = Reservation.new(room: @room)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
