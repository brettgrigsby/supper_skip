FactoryGirl.define do
    sequence(:user) { |n| "The Dawg Pound#{n}" }
  factory :order do
    delivery true
    user
    restaurant
  end
end
