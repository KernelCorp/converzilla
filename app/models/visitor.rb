class Visitor
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :vk_user_info, as: :vkinfoable
  embeds_many :visits

  belongs_to :client

  delegate :uid, :last_name, :first_name, :sex, :url, to: :vk_user_info, prefix: :vk, allow_nil: true

  def visits_count; visits.count; end
end
