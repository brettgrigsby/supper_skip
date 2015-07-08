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
end

