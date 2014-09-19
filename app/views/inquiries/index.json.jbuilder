json.array!(@inquiries) do |inquiry|
  json.extract! inquiry, :id, :name, :email, :description, :quantity
  json.url inquiry_url(inquiry, format: :json)
end
