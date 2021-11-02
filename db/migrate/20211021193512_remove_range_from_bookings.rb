class RemoveRangeFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :range, :duration
  end
end
