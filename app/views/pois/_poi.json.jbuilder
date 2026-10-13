json.extract! poi, :id, :name, :description, :category, :address, :latitude, :longitude, :created_at, :updated_at
json.url poi_url(poi, format: :json)
