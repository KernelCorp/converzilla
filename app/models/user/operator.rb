module User
  class Operator < Base
    belongs_to :client, class_name: 'User::Client'

    def inquires
      client.inquires.where operator: self
    end
  end
end
