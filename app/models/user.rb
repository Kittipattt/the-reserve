class User < ApplicationRecord
  devise :database_authenticatable, :validatable # already handles encryption & validation

  validates :first_name, :last_name, :email, :role, presence: true
end