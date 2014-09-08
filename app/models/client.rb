class Client < User::Base

  devise :registerable

  embeds_many :inquires

  has_many :operators

end
