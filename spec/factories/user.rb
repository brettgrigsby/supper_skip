FactoryGirl.define do
  factory :admin do
    first_name "John"
    last_name  "Doe"
    email      "j@example.com"
    password   "123456789"
  end

  factory :user do
    first_name "John"
    last_name  "Doe"
    email      "j@example.com"
    password   "123456789"
  end
end
