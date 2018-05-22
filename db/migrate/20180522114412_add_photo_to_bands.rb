class AddPhotoToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :photo, :string
  end
end
