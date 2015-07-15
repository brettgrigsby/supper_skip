require_relative '../feature_spec_helper'

describe 'admin', type: :feature do
  include AdminHelper
  before do
    @user = User.create!(	first_name: "Brett", 
				last_name: "Grigsby", 
				email: "brett@mail.com", 
				password: "password")
    @user.roles.create(title: "admin")
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
 
  it 'adds a category to an item' do
    category = @restaurant.categories.create(name: "Dinner")
    @item.categories.create(name: "Lunch", restaurant_id: @restaurant.id)

    visit '/admin_dashboard'
    click_link 'testRest'
    click_on 'edit item'

    click_link 'Dinner'

    item = Item.last

    expect(item.categories).to include(category)
  end
end
