class ReservationsController < ApplicationController
  before_action :authenticate_user!  

  def new
    @room = Room.find_by(id: params[:room_id]) 
    if @room.nil?
      redirect_to rooms_path, alert: "Room not found"
      return
    end

    @reservation = Reservation.new
    @selected_date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    @reservations = @room.reservations.where("DATE(start_time) = ?", @selected_date)

    @available_times = available_times_for(@reservations, @selected_date, @reservation.start_time, @reservation.end_time)
  end

  def create
    @room = Room.find_by(id: params[:reservation][:room_id])  
    if @room.nil?
      redirect_to rooms_path, alert: "Room not found"
      return
    end

    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user  
    @reservation.status = "reserved"  

    if @reservation.start_time == @reservation.end_time
      flash.now[:alert] = "Start time and end time cannot be the same."

      @selected_date = @reservation.start_time.to_date 
      @reservations = @room.reservations.where("DATE(start_time) = ?", @selected_date)
      @available_times = available_times_for(@reservations, @selected_date, @reservation.start_time, @reservation.end_time)

      render :new and return
    end

    if @reservation.invalid?
      @selected_date = @reservation.start_time.to_date
      @reservations = @room.reservations.where("DATE(start_time) = ?", @selected_date)
      @available_times = available_times_for(@reservations, @selected_date, @reservation.start_time, @reservation.end_time)

      render :new and return
    end

    if @reservation.save
      redirect_to dashboard_path, notice: "Reservation successfully created!" 
    else
      @selected_date = @reservation.start_time.to_date
      @reservations = @room.reservations.where("DATE(start_time) = ?", @selected_date)
      @available_times = available_times_for(@reservations, @selected_date, @reservation.start_time, @reservation.end_time)

      render :new  
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :room_id)
  end

  def available_times_for(reservations, date, selected_start_time = nil, selected_end_time = nil)
    all_times = (9..18).flat_map do |hour|
      [ Time.new(date.year, date.month, date.day, hour, 0),
        Time.new(date.year, date.month, date.day, hour, 30) ]
    end

    reserved_ranges = reservations.map { |r| r.start_time.to_i...r.end_time.to_i }

    available_times = all_times.reject do |time|
      reserved_ranges.any? { |range| range.cover?(time.to_i) }
    end

    if selected_start_time.present?
      selected_start_time = selected_start_time.to_i

      available_times.reject! { |time| time.to_i == selected_start_time }

      available_times.reject! do |time|
        reserved_ranges.any? { |range| range.cover?(time.to_i) && time.to_i < selected_start_time }
      end
    end

    if selected_end_time.present?
      selected_end_time = selected_end_time.to_i

      available_times.reject! { |time| time.to_i == selected_end_time }

      available_times.reject! do |time|
        reserved_ranges.any? { |range| range.cover?(time.to_i) && time.to_i > selected_end_time }
      end
    end

    available_times.presence || []
  end
end
