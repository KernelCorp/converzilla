# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :operator, :class => 'User::Operator' do
    email "aaa#{SecureRandom.hex(5)}@bbb.ccc"
    password 'password123'
    association :clients, factory: :clients
  end
end
