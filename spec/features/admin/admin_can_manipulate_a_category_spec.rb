require_relative '../feature_spec_helper'

describe 'admin', type: :feature do
  before do
    @user = User.create!(first_name: "Jane",
      last_name: "Doe",
      email: "jane@jane.com",
      password: "password",)
    @user.roles.create(title: "admin")
    @restaurant = @user.restaurants.create!(name: "Restaurant", description: "restaurant description", slug: "rest")
    @category = @restaurant.categories.create!(name: "Small Plates")
    visit "/"
    first(:link, "Login").click
    fill_in("email address", :with => "jane@jane.com")
    fill_in("password", :with => "password")
    click_button("Login")
  end

  it 'edits a category' do
    restaurant = Restaurant.last
    visit '/admin_dashboard'

    expect(restaurant.categories.pluck(:name)).to include("Small Plates")

    click_link('Restaurant')
    click_link('edit category')

    expect(current_path).to eq(edit_admin_restaurant_category_path(@restaurant, @category))

    fill_in("name", with: "Large Platters")
    click_button('Submit Changes')

    expect(current_path).to eq(admin_restaurant_path(@restaurant))
    expect(page).to have_content "Large Platters"
  end

  it 'deletes a category' do
    restaurant = Restaurant.last

    visit '/admin_dashboard'

    expect(restaurant.categories.pluck(:name)).to include("Small Plates")
    click_link('Restaurant')
    click_link('remove category')

    expect(page).not_to have_content "Small Plates"
  end
end
