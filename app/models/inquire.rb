class Inquire
  include Mongoid::Document

  field :email
  field :name
  field :phone

  embedded_in :client, class_name: 'User::Client'
  belongs_to :operator, class_name: 'User::Operator'
end
