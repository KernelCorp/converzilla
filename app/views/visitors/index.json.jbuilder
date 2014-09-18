json.set! :visitors do
  json.array!(@visitors) do |visitor|
    json.partial! 'visitors/item', visitor: visitor
  end
end
