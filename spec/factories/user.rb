FactoryGirl.define do

  factory :user do
    first_name "John"
    last_name  "Doe"
    sequence(:email) { |n| "test#{n}@example.com" }
    password   "123456789"
  end

  factory :admin do
    first_name "John"
    last_name  "Doe"
    sequence(:email) { |n| "test#{n}@example.com" }
    password   "123456789"
  end
end


