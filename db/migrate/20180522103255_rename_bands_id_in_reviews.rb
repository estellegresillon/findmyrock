class RenameBandsIdInReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :bands_id, :band_id
  end
end
