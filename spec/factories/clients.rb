# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inquire, class: Inquire do
    email "iii#{SecureRandom.hex(5)}@bbb.ccc"
    name 'name'
    phone '123412342'
  end

  factory :client do
    email "aaa#{SecureRandom.hex(5)}@bbb.ccc"
    password 'password123'
    after(:create) do |user|
      user.inquires << FactoryGirl.create(:inquire)
      user.visitors << FactoryGirl.create(:visitor)
      user.save!
    end
  end
end
