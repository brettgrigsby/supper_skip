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

 
  it 'removes a category from a menu item' do
    @item.categories.create(name: "Lunch")

    visit '/admin_dashboard'
    click_link 'testRest'
    click_on 'edit item'

    expect(page).to have_content "Lunch"
    click_link 'Remove Category'
    expect(page).not_to have_content "Lunch"
  end
end
