class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.references :country
      t.references :city
      t.string :address

      t.timestamps
    end
  end
end
