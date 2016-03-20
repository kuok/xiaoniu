json.array!(@competitors) do |competitor|
  json.extract! competitor, :id, :name, :alias, :logo
  json.url competitor_url(competitor, format: :json)
end
