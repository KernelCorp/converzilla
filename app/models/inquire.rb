class Inquire
  include Mongoid::Document
  include Mongoid::Timestamps

  STATUSES = %w(new in_progress close)

  field :email
  field :name
  field :phone
  field :status, default: 'new'

  embedded_in :client
  embeds_one :vk_user_info
  belongs_to :operator

  accepts_nested_attributes_for :vk_user_info

  validates_inclusion_of :status, in: STATUSES
  validates_format_of :email, with: /\A[_a-z0-9-]+(?:\.[_a-z0-9-]+)*@(?:[a-z0-9-]+\.)+[a-z]{2,}\z/i, allow_blank: true

  #fixes mongoid bug https://github.com/mongoid/mongoid/issues/3446
  def set_timestamp
    self.created_at = DateTime.now
    self.updated_at = DateTime.now
  end

end
