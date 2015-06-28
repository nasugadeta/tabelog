json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :shop_name, :phon_number, :address, :url
  json.url restaurant_url(restaurant, format: :json)
end
