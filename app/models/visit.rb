class Visit
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  embedded_in :visitor
end
