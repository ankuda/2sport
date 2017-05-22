# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 5.times do |i|
#   Product.create(name: "Product ##{i}", description: "A product.")
# end

# products = Products.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)

category_list = %w(football hockey basketball)
category_list.each do |c|
  Category.create( title: c )
end

cover_list = %w(grass parquet)
cover_list.each do |c|
  Cover.create( ctype: c )
end

building_list = %w(indoor outdoor)
building_list.each do |c|
  Building.create( btype: c )
end

country_list = %w(Belarus Russia Ukrain)
country_list.each do |country|
  Country.create( title: country )
end

city_list = [
  ["Minsk", 1],
  ["Grodno", 1],
  ["Brest", 1],
  ["Vitebsk", 1],
  ["Gomel", 1],
  ["Mogilev", 1]
]
city_list.each do |city, country_id|
  City.create( title: city, country_id: country_id )
end

location_list = [
  ["Belarus", "Minsk", "av.Victories 22"],
  ["Belarus", "Grodno", "st.Rokossovskogo 88"]
]
location_list.each do |country, city, address|
  country_id = Country.find_by_title( country ).id
  city_id = City.find_by_title( city ).id
  Location.create( country_id: country_id, city_id: city_id, address: address )
end

product_list = [
  [ "Футбольный манеж", "football", "20", "На первом этаже здания размещаются гардероби технические помещения.", "09:00-19:00", "grass", "indoor", "av.Victories 22", "30", "20", "10"],
  [ "ФОК Серебрянка", "hockey", "15", "В манеже действую две сауны с массажными помещениями и микробассейнами.", "10:00-20:00", "parquet", "outdoor", "st.Rokossovskogo 88", "1", "2", "3"]
]

product_list.each do |p|
  c_id = Category.find_by_title( p[1] ).id
  cover_id = Cover.find_by_ctype( p[5] ).id
  building_id = Building.find_by_btype( p[6] ).id
  location_id = Location.find_by_address( p[7] ).id
  p = Product.create( title: p[0], category_id: c_id, price: p[2], description: p[3], working_hours: p[4], cover_id: cover_id, building_id: building_id, location_id: location_id, width: p[8], height: p[9], length: p[10] )
end

User.delete_all
User.create(email: 'admin@example.com', password: 'admin', password_confirmation: 'admin')

# Cover.find_by_ctype("grass").id
# country_list = [
#   [ "Belarus", "Минск", ],
#   [ "France", 65447374 ],
#   [ "Belgium", 10839905 ],
#   [ "Netherlands", 16680000 ]
# ]

# country_list.each do |country, city|
#   Country.create( country: country, city: city )
# end
