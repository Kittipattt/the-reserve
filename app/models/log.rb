class Log < ApplicationRecord
  belongs_to :user

  validates :action, presence: true
end
