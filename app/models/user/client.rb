module User
  class Client < Base

    devise :registerable

    embeds_many :inquires

    has_many :operators, class_name: 'User::Operator'

  end
end
