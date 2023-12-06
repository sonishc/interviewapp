class AddSourceAndSourceIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :source, :string
    add_column :reservations, :source_id, :string
  end
end
