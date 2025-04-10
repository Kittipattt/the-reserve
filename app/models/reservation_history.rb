class ReservationHistory < ApplicationRecord
 belongs_to :reservation
  belongs_to :changed_by, class_name: 'User'
end
