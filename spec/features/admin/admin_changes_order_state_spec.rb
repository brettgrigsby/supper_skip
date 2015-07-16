require_relative '../feature_spec_helper'

describe "an admin changes order state", type: :feature do

  before do
    @admin = User.create(first_name: "Some",
                         last_name: "lady",
                         email: "def@test.com",
		                     password: "password")

    @admin.roles.create(title: "admin")

    visit login_path

    fill_in 'email address', :with => @admin.email
    fill_in 'password',      :with => @admin.password

    click_button("Login")
  end

  it "from ready_for_prep to cancelled state" do
    assert @admin.admin?, 'You are not an admin!'

    @restaurant = @admin.restaurants.create!(name: 'testRest',
                                             description: 'passing or not',
                                             slug: 'a-cool-slug')

    refute @admin.restaurants.empty?, "No restaurant created!"

    @new_order = @admin.restaurants.first.orders.create!(delivery: true)
    @new_order.update(user_id: @admin.id)

    assert @new_order.ready_for_prep?, "Default state not set!"

    visit admin_restaurant_orders_path(@restaurant)

    click_button "Ready for Preparation"

    click_link 'Cancel Order'

    expect(current_path).to eq(admin_restaurant_orders_path(@restaurant))
    expect(page).to have_content @new_order.created_at.to_formatted_s(:long_ordinal)
    expect(page).to have_content "Order ##{@new_order.id}"
  end

  it 'cannot see button to cancel order once order is being prepaired' do

    restaurant = @admin.restaurants.create!(name: 'testRest2',
                                             description: 'passing or not',
                                             slug: 'a-cool-slug2')

    refute @admin.restaurants.empty?, "No restaurant created!"

    new_order = @admin.restaurants.first
    new_order = new_order.orders.create!(delivery: true,
                                         workflow_state: :in_preparation)
    new_order.update(user_id: @admin.id)

    refute new_order.ready_for_prep?, "Should be in_preparation"
    assert new_order.in_preparation?, "Default state not set!"

    visit admin_restaurant_orders_path(restaurant)

    click_button "In Preparation"
    expect(page).to_not have_content('cancel order')
  end
end
