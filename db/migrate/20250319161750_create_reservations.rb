class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.string :car
      t.string :car_owner
      t.string :location
      t.integer :price
      t.boolean :is_booked
      t.integer :user_id_book
      


      t.timestamps
    end
  end
end
