class AddDeviseToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      # Remove this line if email already exists
      # t.string :email, default: '', null: false

      # Devise will add the following columns
      t.string :encrypted_password, default: "", null: false
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
    end
  end
end
