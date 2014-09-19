json.array!(@categories) do |category|
  json.extract! category, :id, :description, :user_id
  json.url category_url(category, format: :json)
end
