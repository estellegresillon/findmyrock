class AddContentToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :content, :text
  end
end
