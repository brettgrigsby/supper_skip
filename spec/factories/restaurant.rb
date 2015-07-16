FactoryGirl.define do


  factory :restaurant do
    sequence(:name) { |n| "The Dawg Pound#{n}" }
    description "Ruff"
    sequence(:slug) { |n| "DawgyDawg#{n}" }
    user
  end
end

