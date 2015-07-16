FactoryGirl.define do

  sequence(:name) { |n| "The Dawg Pound#{n}" }
  sequence(:slug) { |n| "DawgyDawg#{n}" }

  factory :restaurant do
    name
    description "Ruff"
    slug
  end
end

