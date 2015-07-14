require_relative 'feature_spec_helper'

describe "A user who is not logged in" do

  it "cannot access the checkout page" do
    visit cart_path
    expect(page).to_not have_content('Proceed to Checkout')
  end

end

describe 'A user who is logged in' do
  include AdminHelper

  before do
    User.create(first_name: "Joe",
		last_name: "Johnson",
		email: "joe@johnson.com",
		password: "password",
		role: "user")
    restaurant = Restaurant.create!(name: "testRest", description: "yoyo", slug: "slug")
    item = restaurant.items.create!(	title: "thing",
					description: "thingy",
					price: 400)
    visit login_path
    fill_in("email address", with: "joe@johnson.com")
    fill_in("password", with: "password")
    click_button "Login"
    visit restaurant_item_path(restaurant, item)
    click_on "Add to Cart"
    visit cart_path
  end

  it 'can access the checkout page' do
    click_on('Proceed to Checkout')
    expect(current_path).to eq(new_order_path)
    expect(page).to have_content("testRest")
  end

  it 'can get to confirmation screen'  do
    click_on('Proceed to Checkout')
    expect(page).to have_button('Confirm Checkout')
  end
end
