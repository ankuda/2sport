class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string     :title
      t.text       :description
      t.decimal    :price
      t.string     :start_working
      t.string     :end_working
      t.references :category, foreign_key: true
      t.references :location, foreign_key: true
      t.string     :length
      t.string     :width
      t.string     :height
      t.references :cover, foreign_key: true
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
