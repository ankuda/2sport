json.extract! product, :id, :title, :description, :price, :working_hours, :category_id, :location_id, :size_id, :cover_id, :building_id, :created_at, :updated_at
json.url product_url(product, format: :json)
