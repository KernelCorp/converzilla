# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :operator do
    email "aaa#{SecureRandom.hex(5)}@bbb.ccc"
    password 'password123'
    association :client, factory: :client
  end
end
