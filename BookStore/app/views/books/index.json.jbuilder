json.array!(@books) do |book|
  json.extract! book, :id, :title, :autor, :description, :amazon_id
  json.url book_url(book, format: :json)
end
