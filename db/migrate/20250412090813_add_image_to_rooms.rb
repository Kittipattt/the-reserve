class AddImageToRooms < ActiveRecord::Migration[8.0]
  def change
    add_column :rooms, :image, :string
  end
end
