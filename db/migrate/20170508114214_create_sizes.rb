class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.integer :width
      t.integer :height
      t.integer :length

      t.timestamps
    end
  end
end
