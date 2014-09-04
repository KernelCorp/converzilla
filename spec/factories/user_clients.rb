# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client, :class => 'User::Client' do
    email "aaa#{SecureRandom.hex(5)}@bbb.ccc"
    password 'password123'
  end
end
