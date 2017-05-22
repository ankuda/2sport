class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :working_hours
      t.references :category, foreign_key: true
      t.references :location, foreign_key: true
      t.string :width
      t.string :height
      t.string :length

      t.string :btype
      t.string :ctype

      t.timestamps
    end
  end
end
