class Visit
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Geocoder::Model::Mongoid

  field :coordinates, type: Array
  field :location
  field :ip_address

  embedded_in :visitor

  geocoded_by :ip_address, coordinates: :coordinates, address: :location

  default_scope ->{ desc :created_at }
  after_validation :geocode, if: ->(obj){ obj.ip_address.present? }
end
