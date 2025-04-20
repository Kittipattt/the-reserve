class CreatePasswordResets < ActiveRecord::Migration[8.0]
  def change
    create_table :password_resets do |t|
      t.string :email
      t.string :code
      t.datetime :expires_at

      t.timestamps
    end
  end
end
