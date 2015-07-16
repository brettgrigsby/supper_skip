FactoryGirl.define do
  sequence(:email) { |n| "test#{n}@example.com" }

  factory :user do
    first_name "John"
    last_name  "Doe"
    email
    password   "123456789"
  end

  factory :admin do
    first_name "John"
    last_name  "Doe"
    email
    password   "123456789"
  end
end


