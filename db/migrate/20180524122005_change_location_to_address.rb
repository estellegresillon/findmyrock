class ChangeLocationToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :bands, :location, :address
  end
end
