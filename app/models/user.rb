class User < ApplicationRecord
  devise :database_authenticatable, :validatable
  has_many :reservations

  validates :first_name, :last_name, :email, :role, presence: true

  def generate_password_reset_token!
    self.reset_password_token = Devise.friendly_token
    self.reset_password_sent_at = Time.current
    save!
  end  
end
