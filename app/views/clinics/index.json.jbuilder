json.array!(@clinics) do |clinic|
  json.extract! clinic, :name, :description, :status, :user_id, :published, :reviews_count, :rating, :likes_count
  json.url clinic_url(clinic, format: :json)
end
