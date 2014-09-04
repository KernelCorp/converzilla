module User
  class Client < Base
    embeds_many :inquires

    has_many :operators, class_name: 'User::Operator'

  end
end
