# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visitor do
    vk_user_info {FactoryGirl.build(:vk_user_info)}
  end
end
