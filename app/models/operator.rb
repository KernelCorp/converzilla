class Operator < User::Base
  belongs_to :client

  def inquires
    client.inquires.where operator: self
  end
end