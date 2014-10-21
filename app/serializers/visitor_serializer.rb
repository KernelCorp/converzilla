class VisitorSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :vk_uid, :vk_last_name, :vk_first_name, :vk_sex, :vk_url, :visits_count
end
