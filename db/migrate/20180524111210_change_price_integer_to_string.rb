class ChangePriceIntegerToString < ActiveRecord::Migration[5.2]
  def change
    change_column :bands, :price_per_hour, :string
  end
end
