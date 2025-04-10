class CreateRoomAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :room_availabilities do |t|
      t.references :room, null: false, foreign_key: true
      t.datetime :available_from, null: false
      t.datetime :available_to, null: false
      t.string :status, default: 'available'

      t.timestamps
    end
  end
end
