class InquireSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :email, :phone, :name, :status, :created_at, :sort

  def sort
    object.created_at.to_i
  end
end
