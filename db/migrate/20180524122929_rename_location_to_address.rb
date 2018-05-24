class RenameLocationToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :location, :address
  end
end
