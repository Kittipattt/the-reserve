class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.string :roomQrCode
      t.string :status

      t.timestamps
    end
  end
end
