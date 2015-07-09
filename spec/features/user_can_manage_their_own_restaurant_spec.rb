require_relative 'feature_spec_helper'

describe 'a users restaurant', type: :feature do
  let(:user) { User.create!(	first_name: "T",
				last_name: "money",
				email: "test@best.com",
				password: "password")}
  let(:restaurant) { Restaurant.create!(name: "Testaurant", description: "tastes funny", slug: 'testy', user_id: user.id) }

  it 'has a link to edit the restaurant' do
    restaurant.user = user
    visit login_path
    fill_in "email address", with: "test@best.com"
    fill_in "password", with: "password"
    click_button("Login")
    visit user_path(user)

    expect(page).to have_link("edit Testaurant")
  end

  it 'can be edited by the user that created it' do
    restaurant.user = user
    visit login_path
    fill_in "email address", with: "test@best.com"
    fill_in "password", with: "password"
    click_button("Login")
    visit user_path(user)
    click_link("edit Testaurant")

    expect(current_path).to eq(edit_restaurant_path(restaurant))
  end
end


