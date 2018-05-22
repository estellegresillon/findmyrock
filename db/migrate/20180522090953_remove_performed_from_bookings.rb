class RemovePerformedFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :performed
  end
end
