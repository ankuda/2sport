class AddCityIdToCountry < ActiveRecord::Migration[5.0]
  def change
    add_reference :countries, :city, foreign_key: true
  end
end
