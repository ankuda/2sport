json.extract! location, :id, :country, :city, :address, :created_at, :updated_at
json.url location_url(location, format: :json)
