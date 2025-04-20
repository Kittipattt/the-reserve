class AddResetPasswordCodeToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :reset_password_code, :string
  end
end
