json.array!(@push_types) do |push_type|
  json.extract! push_type, :id, :name
  json.url push_type_url(push_type, format: :json)
end
