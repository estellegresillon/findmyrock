class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :number_of_musicians
      t.integer :service_duration
      t.string :music_style
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
