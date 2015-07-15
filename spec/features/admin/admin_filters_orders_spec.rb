require_relative '../feature_spec_helper'

describe "an admin filters orders by state" do
  include AdminHelper

  before do
    login_as_admin
    @restaurant = Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug me')

    @order = @restaurant.orders.create!(delivery: true)
    @cancelled_order = @restaurant.orders.create!(delivery: true, workflow_state: :cancelled)
    @paid_order = @restaurant.orders.create!(delivery: true)
    @ready_for_preparation_order = @restaurant.orders.create!(delivery: true, workflow_state: :ready_for_prep)
    @in_preparation_order = @restaurant.orders.create!(delivery: true, workflow_state: :in_preparation)
    @ready_for_delivery_order = @restaurant.orders.create!(delivery: true, workflow_state: :ready_for_delivery)
    @out_for_delivery_order = @restaurant.orders.create!(delivery: true, workflow_state: :out_for_delivery)
    @cancelled_order = @restaurant.orders.create!(delivery: true, workflow_state: :cancelled)
    @delivered_order = @restaurant.orders.create!(delivery: true, workflow_state: :delivered)
    @all_orders = @restaurant.orders
  end

  def all_orders
    [@paid_order,
     @ready_for_preparation_order,
     @in_preparation_order,
     @ready_for_delivery_order,
     @out_for_delivery_order,
     @delivered_order,
     @cancelled_order]
  end

  it "sees all orders" do
    visit admin_restaurant_orders_path(@restaurant)

    within ".order-display" do
      all_orders.each do |order|
        expect(page).to have_content("Order ##{order.id}")
      end
    end
  end


  it "filters by paid" do
    visit admin_restaurant_orders_path(@restaurant)

    find('button.paid').click

    within ".order-display" do
      expect(page).to have_content "Order ##{@paid_order.id}"

     # expect(page).to have_css('.paid, .hidden')
      expect(page).to have_css('.ready_for_prep, .hidden')
      expect(page).to have_css('.cancelled, .hidden')
      expect(page).to have_css('.in_preparation, .hidden')
      expect(page).to have_css('.ready_for_delivery, .hidden')
      expect(page).to have_css('.out_for_delivery, .hidden')
      expect(page).to have_css('.delivered, .hidden')
    end
  end

  it "filters by ready for preparation" do
    visit admin_restaurant_orders_path(@restaurant)

    find('button.ready_for_prep').click

    within ".order-display" do
      expect(page).to have_content("Order ##{@ready_for_preparation_order.id}")

      expect(page).to have_css('.paid, .hidden')
     # expect(page).to have_css('.ready_for_prep, .hidden')
      expect(page).to have_css('.cancelled, .hidden')
      expect(page).to have_css('.in_preparation, .hidden')
      expect(page).to have_css('.ready_for_delivery, .hidden')
      expect(page).to have_css('.out_for_delivery, .hidden')
      expect(page).to have_css('.delivered, .hidden')
    end
  end
  it "filters by cancelled" do
    visit admin_restaurant_orders_path(@restaurant)

    find('button.cancelled').click

    within ".order-display" do
      expect(page).to have_content("Order ##{@cancelled_order.id}")

      expect(page).to have_css('.paid, .hidden')
      expect(page).to have_css('.ready_for_prep, .hidden')
     # expect(page).to have_css('.cancelled, .hidden')
      expect(page).to have_css('.in_preparation, .hidden')
      expect(page).to have_css('.ready_for_delivery, .hidden')
      expect(page).to have_css('.out_for_delivery, .hidden')
      expect(page).to have_css('.delivered, .hidden')
    end
  end
  it "filters by ready_for_in_preparation" do
    visit admin_restaurant_orders_path(@restaurant)

    find('button.in_preparation').click

    within ".order-display" do
      expect(page).to have_content("Order ##{@in_preparation_order.id}")

      expect(page).to have_css('.paid, .hidden')
      expect(page).to have_css('.ready_for_prep, .hidden')
      expect(page).to have_css('.cancelled, .hidden')
     # expect(page).to have_css('.in_preparation, .hidden')
      expect(page).to have_css('.ready_for_delivery, .hidden')
      expect(page).to have_css('.out_for_delivery, .hidden')
      expect(page).to have_css('.delivered, .hidden')
    end
  end
  it "filters by ready_for_delivery" do
    visit admin_restaurant_orders_path(@restaurant)

    find('button.ready_for_delivery').click

    within ".order-display" do
      expect(page).to have_content("Order ##{@ready_for_delivery_order.id}")

      expect(page).to have_css('.paid, .hidden')
      expect(page).to have_css('.ready_for_prep, .hidden')
      expect(page).to have_css('.cancelled, .hidden')
      expect(page).to have_css('.in_preparation, .hidden')
     # expect(page).to have_css('.ready_for_delivery, .hidden')
      expect(page).to have_css('.out_for_delivery, .hidden')
      expect(page).to have_css('.delivered, .hidden')
    end
  end
  it "filters by out_for_delivery" do
    visit admin_restaurant_orders_path(@restaurant)

    find('button.out_for_delivery').click

    within ".order-display" do
      expect(page).to have_content("Order ##{@out_for_delivery_order.id}")

      expect(page).to have_css('.paid, .hidden')
      expect(page).to have_css('.ready_for_prep, .hidden')
      expect(page).to have_css('.cancelled, .hidden')
      expect(page).to have_css('.in_preparation, .hidden')
      expect(page).to have_css('.ready_for_delivery, .hidden')
     # expect(page).to have_css('.out_for_delivery, .hidden')
      expect(page).to have_css('.delivered, .hidden')
    end
  end
  it "filters by delivered" do
    visit admin_restaurant_orders_path(@restaurant)

    find('button.delivered').click

    within ".order-display" do
      expect(page).to have_content("Order ##{@delivered_order.id}")

      expect(page).to have_css('.paid, .hidden')
      expect(page).to have_css('.ready_for_prep, .hidden')
      expect(page).to have_css('.in_preparation, .hidden')
      expect(page).to have_css('.cancelled, .hidden')
      expect(page).to have_css('.ready_for_delivery, .hidden')
      expect(page).to have_css('.out_for_delivery, .hidden')
    end
  end
end
