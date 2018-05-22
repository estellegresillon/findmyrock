class RemoveServiceDurationFromBands < ActiveRecord::Migration[5.2]
  def change
    remove_column :bands, :service_duration
  end
end
