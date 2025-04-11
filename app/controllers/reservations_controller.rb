class ReservationsController < ApplicationController
  before_action :authenticate_user!  # Ensure the user is authenticated

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new

    @selected_date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    @reservations = @room.reservations.where("DATE(start_time) = ?", @selected_date)

    # Get the available times based on the selected date and selected times (if any)
    @available_times = available_times_for(@reservations, @selected_date, @reservation.start_time, @reservation.end_time)
  end

  def create
    @room = Room.find(params[:reservation][:room_id])  # Fetch room based on passed room_id
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user  # Assign the current user to the reservation
    @reservation.status = "reserved"  # Set the status to 'reserved'

    # Save the reservation if no conflicts
    if @reservation.save
      redirect_to dashboard_path, notice: "Reservation successfully created!"  # Redirect to dashboard
    else
      render :new
    end
  end



  private

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :room_id)
  end

  # This method calculates available times based on existing reservations
  def available_times_for(reservations, date, selected_start_time = nil, selected_end_time = nil)
    # Generate all times from 9:00 to 18:00 in half-hour intervals
    all_times = (9..18).flat_map do |hour|
      [ Time.new(date.year, date.month, date.day, hour, 0),
       Time.new(date.year, date.month, date.day, hour, 30) ]
    end

    # Map reservations to ranges (start time to end time)
    reserved_ranges = reservations.map { |r| r.start_time.to_i...r.end_time.to_i }

    # Exclude times that are already reserved
    available_times = all_times.reject do |time|
      reserved_ranges.any? { |range| range.cover?(time.to_i) }
    end

    # If a user selected a start time, exclude that time and any overlapping time
    if selected_start_time.present?
      selected_start_time = selected_start_time.to_i

      # Remove the selected start time from the available options
      available_times.reject! { |time| time.to_i == selected_start_time }

      # Filter out times that are before any reservation's end time
      available_times.reject! do |time|
        reserved_ranges.any? { |range| range.cover?(time.to_i) && time.to_i < selected_start_time }
      end
    end

    # If a user selected an end time, exclude times that are before the selected end time
    if selected_end_time.present?
      selected_end_time = selected_end_time.to_i

      # Remove the selected end time from the available options
      available_times.reject! { |time| time.to_i == selected_end_time }

      # Filter out times that overlap with any reservation
      available_times.reject! do |time|
        reserved_ranges.any? { |range| range.cover?(time.to_i) && time.to_i > selected_end_time }
      end
    end

    available_times
  end
end
