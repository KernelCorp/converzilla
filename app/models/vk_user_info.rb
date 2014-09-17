class VkUserInfo
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic


  class Contacts
    include Mongoid::Document

    field :mobile_phone
    field :home_phone
  end

  field :first_name
  field :last_name
  field :sex
  field :bdate
  field :city
  field :country
  field :uid

  embedded_in :vkinfoable, polymorphic: true

  embeds_one :contacts

  accepts_nested_attributes_for :contacts

  def url
    "http://vk.com/id#{uid}"
  end

end