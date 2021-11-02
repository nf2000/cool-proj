class AddRangeToBookings2 < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :duration, :daterange
  end
end
