class AddColumnsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :delivery_location, :string
    add_column :reservations, :insurance, :string
    add_column :reservations, :price_payed, :integer
  end
end
