class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string, unique: true
    add_column :users, :password_digest, :string
    add_column :users, :role, :string, default: "employee"
  end
end
