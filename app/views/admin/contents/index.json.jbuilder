json.array!(@contents) do |content|
  json.extract! content, :name, :announce, :body, :page_id
  json.url content_url(content, format: :json)
end
