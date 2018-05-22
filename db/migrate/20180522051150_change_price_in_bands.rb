class ChangePriceInBands < ActiveRecord::Migration[5.2]
  def change
    rename_column :bands, :price, :price_per_hour
  end
end
