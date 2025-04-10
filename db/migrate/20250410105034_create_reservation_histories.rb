class CreateReservationHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :reservation_histories do |t|
      t.references :reservation, null: false, foreign_key: true
      t.string :action
      t.references :changed_by, null: false, foreign_key: { to_table: :users }
      t.string :previous_status
      t.string :new_status

      t.timestamps
    end
  end
end
