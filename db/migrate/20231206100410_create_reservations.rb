class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.integer :price
      t.datetime :listing_created_at
      t.string :guest_name
      t.integer :listing_id
      t.string :status

      t.timestamps
    end
  end
end
