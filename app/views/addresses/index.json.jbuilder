json.array!(@addresses) do |address|
  json.extract! address, :phone_number, :mobile_phone_number, :address_1, :address_2, :city, :state, :zip_code, :addressable_id, :addressable_type
  json.url address_url(address, format: :json)
end
