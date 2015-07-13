require_relative '../feature_spec_helper'

describe "an admin filters orders by state" do
  include AdminHelper

  before do
    login_as_admin
    @restaurant = Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug')
    @basket_order = create :order, aasm_state: "basket"
    @ordered_order = create :order, aasm_state: "ordered"
    @paid_order = create :order, aasm_state: "paid"
    @completed_order = create :order, aasm_state: "completed"
    @cancelled_order = create :order, aasm_state: "cancelled"
    @all_orders = @restaurant.orders
  end

  def all_orders
    [@basket_order, @ordered_order, @paid_order, @completed_order, @cancelled_order]
  end

  it "sees all orders" do
    visit admin_restaurant_orders_path(@restaurant)

    within ".order-display" do
      all_orders.each do |order|
        expect(page).to have_content("Order ##{order.id}")
      end
    end
  end

  it "filters by basket" do
    visit admin_restaurant_orders_path(@restaurant)

    within ".order-filters" do
      click_on "Basket"
    end

    within ".order-display" do
      expect(page).to have_content "Order ##{@basket_order.id}"
      expect(page).not_to have_content "Order ##{@paid_order.id}"
    end
  end

  # Don't forget to refute other content exists
  it "filters by ordered" do
    visit admin_restaurant_orders_path(@restaurant)

    within ".order-filters" do
      click_on "Ordered"
    end

    within ".order-display" do
      expect(page).to have_content "Order ##{@ordered_order.id}"
      expect(page).not_to have_content "Order ##{@completed_order.id}"
    end
  end

  it "filters by paid" do
    visit admin_restaurant_orders_path(@restaurant)

    within ".order-filters" do
      click_on "Paid"
    end

    within ".order-display" do
      expect(page).to have_content "Order ##{@paid_order.id}"
      expect(page).not_to have_content "Order ##{@basket_order.id}"
    end
  end

  it "filters by complete" do
    visit admin_restaurant_orders_path(@restaurant)

    within ".order-filters" do
      click_on "Complete"
    end

    within ".order-display" do
      expect(page).to have_content("Order ##{@completed_order.id}")
      expect(page).not_to have_content "Order ##{@paid_order.id}"
    end
  end

  it "filters by cancelled" do
    visit admin_restaurant_orders_path(@restaurant)

    within ".order-filters" do
      click_on "Cancelled"
    end

    within ".order-display" do
      expect(page).to have_content("Order ##{@cancelled_order.id}")
      expect(page).not_to have_content "Order ##{@paid_order.id}"
    end
  end
end
