json.array!(@registrations) do |registration|
  json.extract! registration, :user_id, :category_id, :last_name, :name, :full_name, :specialty, :city, :phone_number, :description, :status
  json.url registration_url(registration, format: :json)
end
