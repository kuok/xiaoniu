json.array!(@pushes) do |push|
  json.extract! push, :id, :p_date, :content, :competitor_id, :type_id
  json.url push_url(push, format: :json)
end
