class OperatorSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :email, :created_at, :updated_at
end
