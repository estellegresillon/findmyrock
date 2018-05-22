class DeleteReviewsFromBands < ActiveRecord::Migration[5.2]
  def change
    remove_column :bands, :reviews_id
  end
end
