json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :Ticket
  json.url comment_url(comment, format: :json)
end
