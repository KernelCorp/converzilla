class OperatorMailer < ActionMailer::Base
  def create(operator)
    @operator = operator
    mail to: operator.email
  end
end
