json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :title, :copy_to, :active, :Client, :Admin
  json.url ticket_url(ticket, format: :json)
end
