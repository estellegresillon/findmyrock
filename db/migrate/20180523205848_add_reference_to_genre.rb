class AddReferenceToGenre < ActiveRecord::Migration[5.2]
  def change
    add_reference :genres, :band, foreign_key: true
  end
end
