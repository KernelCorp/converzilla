class VisitSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  
  attributes :id, :created_at, :ip_address, :location
end
