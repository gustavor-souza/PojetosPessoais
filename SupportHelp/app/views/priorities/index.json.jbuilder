json.array!(@priorities) do |priority|
  json.extract! priority, :id, :description
  json.url priority_url(priority, format: :json)
end
