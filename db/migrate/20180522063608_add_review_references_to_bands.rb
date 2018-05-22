class AddReviewReferencesToBands < ActiveRecord::Migration[5.2]
  def change
    add_reference :bands, :reviews, index:true
  end
end
