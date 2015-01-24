json.array!(@subjects) do |subject|
  json.extract! subject, :id, :title, :active, :System
  json.url subject_url(subject, format: :json)
end
