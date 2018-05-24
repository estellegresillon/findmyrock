class ChangeBudgetStringToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :bands, :price_per_hour, 'integer USING CAST(price_per_hour AS integer)'
  end
end
