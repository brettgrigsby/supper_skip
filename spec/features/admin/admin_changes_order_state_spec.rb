require_relative '../feature_spec_helper'

describe "an admin changes order state" do
  # let(:restaurant) { Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug') }
  # let(:current_order) { Order.create!(delivery: true) }
  # let(:item) { restaurant.items.create!(title: 'myitem', description: 'a item', price: 5 ) }

  before do
    admin = create(:user)
    visit login_path
    fill_in 'email address', :with => admin.email
    fill_in 'password', :with => admin.password
    click_button("Login")

    @restaurant = Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug')
    @current_order = @restaurant.orders.create!(delivery: true)
    @current_order = @current_order.items.create!(title: 'myitem', description: 'a item', price: 5 )
    #@item = @current_order.items.last
  end

   xit "changes one order from ordered to paid state" do
    order = create :order, aasm_state: "ordered"
    visit admin_restaurant_orders_path(@restaurant, scope: 'ordered')
save_and_open_page

    within "h4.pull-left" do
      click_link_or_button 'Mark as Paid'
    end

    expect(current_url).to eq admin_orders_url(scope: 'paid')
    within ".order-display" do
      expect(page).to have_content order.created_at.to_formatted_s(:long_ordinal)
      expect(page).to have_content "Order ##{order.id}"
    end
  end

  xit "changes one order from paid to completed state" do
    order = create :order, aasm_state: "paid"
   # visit admin_orders_path(scope: 'paid')
    visit admin_restaurant_orders_path(@restaurant, scope: 'paid')

    within "h4.pull-left" do
      click_link_or_button 'Mark as Completed'
    end

    expect(current_url).to eq admin_orders_url(scope: 'completed')
    within ".order-display" do
      expect(page).to have_content order.created_at.to_formatted_s(:long_ordinal)
      expect(page).to have_content "Order ##{order.id}"
    end
  end

  xit "changes one order from ordered to cancelled state" do
    order = create :order, aasm_state: "ordered"
    #visit admin_orders_path(scope: 'ordered')
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

  xit "changes one order from paid to cancelled state" do
    order = create :order, aasm_state: "paid"
   # visit admin_orders_path(scope: 'paid')
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
