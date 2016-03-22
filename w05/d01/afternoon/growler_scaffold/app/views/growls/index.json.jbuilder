json.array!(@growls) do |growl|
  json.extract! growl, :id, :message
  json.url growl_url(growl, format: :json)
end
