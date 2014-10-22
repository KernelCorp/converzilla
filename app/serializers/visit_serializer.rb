class VisitSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  
  attributes :id, :created_at
end
