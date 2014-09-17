json.set! :id, visitor.id.to_s
json.set! :vk_user_info do
  json.partial! 'vk_user_info/item', vk_user_info: visitor.vk_user_info
end