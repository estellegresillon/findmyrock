class AddReviewsToBands < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :bands, index: true
  end
end
