class VkUserInfo
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  embedded_in :inquire
end