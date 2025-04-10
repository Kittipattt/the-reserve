class RoomsController < ApplicationController
  before_action :set_room, only: [ :show, :edit, :update, :destroy ]
  before_action :require_admin

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: "Room created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @room.update(room_params)
      redirect_to rooms_path, notice: "Room updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path, notice: "Room deleted."
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :description, :roomQrCode, :status)
  end

  def require_admin
    redirect_to root_path, alert: "Access denied" unless current_user&.role == "admin"
  end
end
