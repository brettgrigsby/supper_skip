require_relative 'feature_spec_helper'

describe 'a users restaurant', type: :feature do
  let(:user) { User.create!(	first_name: "T",
				last_name: "money",
				email: "test@best.com",
				password: "password")}
  let(:restaurant) { Restaurant.create!(name: "Testaurant", description: "tastes funny", slug: 'testy', user_id: 1) }

  it 'has a show page with its info' do
    restaurant.user = user
    visit restaurant_path(restaurant)

    expect(page).to have_content("Testaurant")
    expect(page).to have_content("tastes funny")

    
  end
end


