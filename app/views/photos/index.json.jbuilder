json.array!(@listings) do |listing|
  json.extract! listing, :id, :address, :price, :description, :details, :user_id
  json.url listing_url(listing, format: :json)
end
