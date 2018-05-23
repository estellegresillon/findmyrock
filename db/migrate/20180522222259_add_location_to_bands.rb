class AddLocationToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :location, :string
  end
end
