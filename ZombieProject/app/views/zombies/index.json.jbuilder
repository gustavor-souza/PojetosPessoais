json.array!(@zombies) do |zombie|
  json.extract! zombie, :id, :name, :bio, :age, :rotting
  json.url zombie_url(zombie, format: :json)
end
