class AddPasswordResetTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_reset_token, :string
    add_column :users, :reset_password_sent_at, :datetime
  end
end

