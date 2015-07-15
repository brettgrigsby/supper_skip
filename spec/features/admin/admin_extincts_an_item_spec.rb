require_relative '../feature_spec_helper'

describe 'admin', type: :feature do
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

  it 'changes an item from endangered to extinct' do
    item = Item.create(title: "hi", description: "mom", price: 10)
    category = Category.create(name: "Dinner")
    item.categories.create(name: "Lunch")

    visit admin_item_path(item)

    within ".scarcity" do
      expect(page).to have_content("Endangered")
    end

    click_link 'Trigger Extinction Event'

    within ".scarcity" do
      expect(page).to have_content("Extinct")
    end
  end
end
