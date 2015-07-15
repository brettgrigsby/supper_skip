require_relative 'feature_spec_helper'

describe 'a users restaurant', type: :feature do
  let(:user) { User.create!(	first_name: "T",
				last_name: "money",
				email: "test@best.com",
				password: "password",
        role: "admin")}
  let(:restaurant) { Restaurant.create!(name: "Testaurant", description: "tastes funny", slug: 'testy', user_id: user.id) }

  before do
    user.roles.create!([{title: "admin"}, {title: "user"}])    
  end

  it 'has a link to edit the restaurant' do
    restaurant.user = user
    visit login_path
    fill_in "email address", with: "test@best.com"
    fill_in "password", with: "password"
    click_button("Login")
    visit admin_dashboard_path(user)

    expect(page).to have_link("edit Testaurant")
  end

  xit 'can be edited by the user that created it' do
    restaurant.user = user
    visit login_path
    fill_in "email address", with: "test@best.com"
    fill_in "password", with: "password"
    click_button("Login")
    visit admin_dashboard_path(user)
    click_link("edit Testaurant")

    expect(current_path).to eq(edit_restaurant_path(restaurant))

    fill_in("Testaurant", with: "Changed Name")
    click_button("Update My Restaurant")

    expect(current_path).to eq(restaurant_path(restaurant))
    expect(page).to have_content("Changed Name")
    expect(page).not_to have_content("Testaurant")
  end

  xit 'cannot be edited by users outside of its creator' do
    user2 = User.create!(first_name: "Other",
			last_name: "Person",
			email: "other@person.com",
			password: "password")
    restaurant.user = user
    visit login_path
    fill_in "email address", with: "other@person.com"
    fill_in "password", with: "password"
    click_button("Login")
    visit user_path(user2)

    expect(page).not_to have_content("edit Testaurant")

    visit edit_restaurant_path(restaurant)

    expect(status_code).to eq(404)
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end


