require_relative '../feature_spec_helper'

describe 'the admin dashboard', type: :feature do
  include AdminHelper

  before do
    user = User.create!(first_name: "Brett", 
		last_name: "Grigsby", 
		email: "email@mail.com", 
		password: "password", 
		role: "admin")
    @restaurant = user.restaurants.create!(name: "some", description: "thing", slug: "something")
    visit "/"
    first(:link, "Login").click

    fill_in("email address", :with => "email@mail.com")
    fill_in("password", :with => "password")
    click_button("Login")
  end
  
  it 'has links to users restaurants' do
    
    visit '/admin_dashboard'
    expect(page).to have_link "some", href: admin_restaurant_path(@restaurant)
  end
end
