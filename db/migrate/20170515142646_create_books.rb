class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.integer :product_id, index: true
      t.string :year
      t.string :month
      t.string :day
      t.string :hours
      t.string :minutes

      t.timestamps
    end
  end
end
