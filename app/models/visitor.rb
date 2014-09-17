class Visitor
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :vk_user_info, as: :vkinfoable

  belongs_to :client
end
