class AddNameToGenre < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :name, :string
  end
end
