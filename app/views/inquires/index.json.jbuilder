json.set! :inquires do
  json.array!(@inquires) do |inquire|
    json.partial! 'inquires/item', inquire: inquire
  end
end
