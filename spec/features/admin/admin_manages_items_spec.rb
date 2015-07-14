describe 'a restaurant owner', type: :feature do
  let(:user) { User.create(first_name: "Jane",
                last_name: "Doe",
                email: "jane@jane.com",
                password: "password") }
  before do
    user.roles.create(title: "admin")
    user.restaurants.create!(name: "Restaurant", description: "restaurant description", slug: "rest")
    user.restaurants.first.items.create(title: "Thing", 
					description: "item description",
					price: 200)					
    visit "/"
    first(:link, "Login").click

    fill_in("email address", :with => "jane@jane.com")
    fill_in("password", :with => "password")
    click_button("Login")
  end

  it "can edit the items in their restaurant" do
    restaurant = user.restaurants.last
    item = restaurant.items.last
    visit admin_restaurant_path(restaurant)
    
    expect(page).to have_content(restaurant.name)
    expect(page).to have_content("Thing")
    click_link("edit item")

    expect(current_path).to eq(edit_admin_restaurant_item_path(restaurant, item))

    fill_in("Title", with: "Different")
    click_button("Update Item")

    expect(current_path).to eq(admin_restaurant_path(restaurant))
    expect(page).to have_link("Different")
    expect(page).not_to have_link("Thing")
  end

  it "can't edit another owners items" do
    restaurant = user.restaurants.last
    item = restaurant.items.last
    user2 = User.create!(first_name: "Other",
			last_name: "User",
			email: "something@some.com",
			password: "password")
    user2.roles.create(title: "admin")
    restaurant2 = user2.restaurants.create!(name: "Dudes", description: "yep", slug: "dudes")
    item2 = restaurant2.items.create!(title: "Stuff", description: "huge", price: 300)
    visit admin_restaurant_path(restaurant)

    expect(page).to have_link("Thing")
    expect(page).not_to have_link("Stuff")

    visit edit_admin_restaurant_item_path(restaurant2, item2)

    expect(status_code).to eq(404)

  end
end

