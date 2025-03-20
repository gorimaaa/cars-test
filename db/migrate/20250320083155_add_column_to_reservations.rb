class AddColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :is_payed, :boolean
  end
end
