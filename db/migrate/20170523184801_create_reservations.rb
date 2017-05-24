class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :time

      t.belongs_to :book
      t.belongs_to :product

      t.timestamps
    end
  end
end
