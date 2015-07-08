require_relative 'feature_spec_helper'

describe 'a restaurant', type: :feature do
  let(:restaurant) { Restaurant.create!(name: "Testaurant", description: "tastes funny", slug: 'testy', user_id: 1) }

  it 'has a show page with its info' do
    visit restaurant_path(restaurant)

    expect(page).to have_content("Testaurant")
    expect(page).to have_content("tastes funny")
  end

  it 'has a slug in its url' do
    visit restaurant_path(restaurant)
    expect(current_path).to eq('/restaurants/testy')
  end

  it 'has links to its own categories' do
    restaurant.categories.create!(name: "birds")
    new = Restaurant.create!(name: "new", description: "thing", slug: "slugggg", user_id: 1)
    new.categories.create!(name: "gum")
    visit restaurant_path(restaurant)

    expect(page).to have_content("birds")
    expect(page).not_to have_content("gum")
  end
end

