json.array!(@corgis) do |corgi|
  json.extract! corgi, :id, :name, :age, :user_id
  json.url corgi_url(corgi, format: :json)
end
