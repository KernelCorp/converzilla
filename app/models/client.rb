class Client < User::Base

  devise :registerable

  embeds_many :inquires, order: :created_at.desc

  has_many :operators

end
