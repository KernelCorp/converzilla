class Visit
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  embedded_in :visitor

  default_scope ->{ desc :created_at }
end
