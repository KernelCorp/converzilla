class Visitor
  include Mongoid::Document

  embeds_one :vk_user_info

  belongs_to :client
end
