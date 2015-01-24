json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :title, :active, :System, :Subject, :Priority
  json.url ticket_url(ticket, format: :json)
end
