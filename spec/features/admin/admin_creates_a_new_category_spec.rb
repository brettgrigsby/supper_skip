require_relative '../feature_spec_helper'

describe 'admin', type: :feature do
  before do
    @user = User.create(first_name: "Jane",
                last_name: "Doe",
                email: "jane@jane.com",
                password: "password",
                role: "admin") 
    @resturant = @user.restaurants.create!(name: "Restaurant", description: "restaurant description", slug: "rest")
    visit "/"
    first(:link, "Login").click

    fill_in("email address", :with => "jane@jane.com")
    fill_in("password", :with => "password")
    click_button("Login")
  end

  it 'creates a new category' do

    visit '/admin_dashboard'
    click_link "Restaurant"
    click_link "Add Category"
    fill_in "Name", with: "Small Plates"
    click_button "Create Category"
    restaurant = Restaurant.last
    expect(restaurant.categories.pluck(:name)).to include("Small Plates")
  end
end
