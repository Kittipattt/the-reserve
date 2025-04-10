class AddImageUrlToRooms < ActiveRecord::Migration[8.0]
  def change
    add_column :rooms, :image_url, :string
  end
end
