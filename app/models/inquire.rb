class Inquire
  include Mongoid::Document

  STATUSES = %w(new in_progress close)

  field :email
  field :name
  field :phone
  field :status, default: 'new'

  embedded_in :client
  belongs_to :operator

  validates_inclusion_of :status, in: STATUSES
  validates_format_of :email, with: /\A[_a-z0-9-]+(?:\.[_a-z0-9-]+)*@(?:[a-z0-9-]+\.)+[a-z]{2,}\z/i, allow_blank: true
end
