class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :status, inclusion: { in: ['reserved', 'cancelled', 'pending'], message: "%{value} is not a valid status" }
  validate :end_time_after_start_time

  before_save :convert_to_utc

  private

  def end_time_after_start_time
    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end

  def convert_to_utc
    self.start_time = start_time.in_time_zone('UTC')
    self.end_time = end_time.in_time_zone('UTC')
  end
end
