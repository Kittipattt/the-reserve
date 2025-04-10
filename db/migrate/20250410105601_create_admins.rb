class CreateAdmins < ActiveRecord::Migration[8.0]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, unique: true
      t.string :role, default: 'admin'

      t.timestamps
    end

    add_index :admins, :email, unique: true
  end
end
