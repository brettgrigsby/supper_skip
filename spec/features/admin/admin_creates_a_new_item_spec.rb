require_relative '../feature_spec_helper'

describe 'admin', type: :feature do
  before do
    @user = User.create!(	first_name: "Brett", 
				last_name: "Grigsby", 
				email: "brett@mail.com", 
				password: "password", 
				role: "admin")
    @restaurant = @user.restaurants.create!(	name: 'testRest', 
						description: 'passing or not', 
						slug: 'slug')
    @item = @restaurant.items.create!(title: 'myitem', description: 'a item', price: 5 )
    visit "/"
    first(:link, "Login").click

    fill_in("email address", :with => "brett@mail.com")
    fill_in("password", :with => "password")
    click_button("Login")
  end

  it 'creates a new menu item' do
    visit '/admin_dashboard'
    click_link "testRest"
    click_link "Add Item"
    fill_in "Title", with: "NewItem"
    fill_in "Description", with: "NewItemDescription"
    fill_in "Price", with: 20
    attach_file "Image", 'spec/fixtures/missing.jpg'
    click_button "Create Item"

    expect(page).to have_content "NewItem"
  end
end
