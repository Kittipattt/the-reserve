class Room < ApplicationRecord
  has_many :reservations
  has_many :room_availabilities
end
