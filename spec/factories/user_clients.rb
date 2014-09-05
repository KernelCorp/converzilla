# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :clients, :class => 'User::Client' do
    email "aaa#{SecureRandom.hex(5)}@bbb.ccc"
    password 'password123'
    inquires [FactoryGirl.build(:inquire)]
  end
end
