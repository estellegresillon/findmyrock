class RemoveBandIdFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :band_id
  end
end
