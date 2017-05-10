json.extract! address, :id, :street_line_1, :street_line_2, :city, :state, :zip, :latitude, :longitude, :created_at, :updated_at
json.url address_url(address, format: :json)
