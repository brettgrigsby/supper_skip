require_relative '../feature_spec_helper'

describe "an admin changes order state" do

  before do
    admin = User.create(first_name: "Some", last_name: "lady", email: "def@test.com",
			password: "password")
    admin.roles.create(title: "admin")
    visit login_path
    fill_in 'email address', :with => admin.email
    fill_in 'password', :with => admin.password
    click_button("Login")

    @restaurant = Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug')
    @new_order = @restaurant.orders.create!(delivery: true)
    @new_order = @new_order.items.create!(title: 'myitem', description: 'a item', price: 5 )
  end

  it "changes one order from paid to cancelled state" do
    visit admin_restaurant_orders_path(@restaurant)
    save_and_open_page

    within "h4.pull-left" do
      click_link_or_button 'Cancel Order'
    end

    expect(current_url).to eq admin_orders_url(scope: 'cancelled')
    within ".order-display" do
      expect(page).to have_content order.created_at.to_formatted_s(:long_ordinal)
      expect(page).to have_content "Order ##{order.id}"
    end
  end

  xit "changes one order from ready_for_prep to cancelled state" do
    visit admin_restaurant_orders_path(@restaurant, scope: 'cancelled')

    within "h4.pull-left" do
      click_link_or_button 'Cancel Order'
    end

    expect(current_url).to eq admin_orders_url(scope: 'cancelled')
    within ".order-display" do
      expect(page).to have_content order.created_at.to_formatted_s(:long_ordinal)
      expect(page).to have_content "Order ##{order.id}"
    end
  end
end
