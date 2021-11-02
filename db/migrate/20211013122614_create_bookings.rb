class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :guests, default: 1
      t.date :check_in
      t.date :check_out 
      t.timestamps
      t.references :user
      t.references :room
    end
  end
end
