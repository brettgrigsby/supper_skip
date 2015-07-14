require_relative '../feature_spec_helper'

describe "an admin filters orders by state" do
  include AdminHelper

  let(:restaurant) { Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug me') }
  # let(:paid_order) { Order.create!(delivery: true) }
  #
  # let(:ready_for_preparation_order) { Order.create!(delivery: true, workflow_state: :ready_for_preparation) }
  # let(:cancelled_order) { Order.create!(delivery: true, workflow_state: :cancelled) }



  before do
    login_as_admin
    @restaurant = Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug me')
    @order = @restaurant.orders.create!(delivery: true)
    @cancelled_order = @restaurant.orders.create!(delivery: true, workflow_state: :cancelled)
    @paid_order = @restaurant.orders.create!(delivery: true)

    # @paid_order = create :order, workflow_state: :paid
    # @ready_for_preparation_order = create :order, workflow_state: :ready_for_preparation
    # @in_preparation_order = create :order, workflow_state: :in_preparation
    # @ready_for_delivery_order = create :order, workflow_state: :ready_for_delivery
    # @out_for_delivery_order = create :order, workflow_state: :out_for_delivery
    # #@cancelled_order = create! :order, workflow_state: :cancelled
    # @delivered_order = create :order, workflow_state: :delivered
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
    visit admin_restaurant_order_path(@restaurant, @order, @order.workflow_state)

    within ".order-display" do
      all_orders.each do |order|
        expect(page).to have_content("Order ##{order.id}")
      end
    end
  end

it "filters by cancelled" do
   visit admin_restaurant_order_path(@restaurant, @cancelled_order, :cancelled)

    within ".order-filters" do
      click_on "Cancelled"
    end

    within ".order-display" do
      expect(page).to have_content("Order ##{@cancelled_order.id}")
      expect(page).not_to have_content "Order ##{@paid_order.id}"
    end
  end


  it "filters by paid" do
    visit admin_restaurant_order_path(@restaurant.id, @paid_order, :paid, action: :index)

    within ".order-filters" do
      click_on "Paid"
    end

    within ".order-display" do
      expect(page).to have_content "Order ##{@paid_order.id}"
      expect(page).not_to have_content "Order ##{@basket_order.id}"
    end
  end

  xit "filters by complete" do
    visit admin_restaurant_orders_path(@restaurant)

    within ".order-filters" do
      click_on "Complete"
    end

    within ".order-display" do
      expect(page).to have_content("Order ##{@completed_order.id}")
      expect(page).not_to have_content "Order ##{@paid_order.id}"
    end
  end

xit "filters by cancelled" do
   visit admin_restaurant_order_path(@restaurant, @cancelled_order, :cancelled)

    within ".order-filters" do
      click_on "Cancelled"
    end

    within ".order-display" do
      expect(page).to have_content("Order ##{@cancelled_order.id}")
      expect(page).not_to have_content "Order ##{@paid_order.id}"
    end
  end
end
