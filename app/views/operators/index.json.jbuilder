json.set! :operators do
  json.array!(@operators) do |operator|
    json.set! :id, operator.id.to_s
    json.extract! operator, :email
    json.url operator_url(operator, format: :json)
  end
end
