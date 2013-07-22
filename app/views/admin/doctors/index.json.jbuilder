json.array!(@doctors) do |doctor|
  json.extract! doctor, 
  json.url doctor_url(doctor, format: :json)
end
