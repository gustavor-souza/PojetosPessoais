json.array!(@admins) do |admin|
  json.extract! admin, :id, :name, :master, :User, :active
  json.url admin_url(admin, format: :json)
end
