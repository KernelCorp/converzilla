json.array!(@inquires) do |inquire|
  json.extract! inquire, :id
  json.url inquire_url(inquire, format: :json)
end
