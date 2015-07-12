require 'rails_helper'

RSpec.describe Order, :type => :model do

  let(:order) { Order.create!(delivery: true) }
  let(:restaurant) { Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug') }
  let(:item) { restaurant.items.create!(title: 'myitem', description: 'a item', price: 5 ) }
  let(:item2) { restaurant.items.create!(title: 'myitem2', description: 'a 2nd item', price: 5 ) }

  let(:address) do
    Address.new(order_id: 1, street_1: "123 Washington St", city: "Denver", state: "CO", zip: "80202")
  end

  it "belongs to one user" do
    user = User.new
    order.user_id = user.id
    expect(order.user_id).to eq(user.id)
  end

  it 'is valid' do
    expect(order).to be_valid
  end

  it 'is valid if delivery is false' do
    order.delivery = false
    expect(order).to be_valid
  end

  it 'is invalid without a delivery designation' do
    order.delivery = nil
    expect(order).to_not be_valid
  end

  it 'is valid with delivery designated as false' do
    order.delivery = false
    expect(order).to be_valid
  end

  it 'has address if delivery is true' do
    # address = Address.find_by_order_id(order.id)
    expect(order.delivery).to eq(true)
    expect(address.order_id).to eq(order.id)
  end

  it 'has many items' do

    item.orders << order
    item2.orders << order

    assert item.orders.include?(order)
    assert item2.orders.include?(order)
  end

  it 'adds item to order' do
    order.add_item(item)
    assert order.items.include? item
  end

  it 'removes item from order' do
    order.add_item(item)
    order.remove_item(item)
    refute order.items.include? item
  end

  it 'increases quantity if item is in order' do
    order.add_item(item)
    order.add_item(item)
    assert order.items.length == 1
  end

  it 'tells arrival time on payment' do
    order.order
    order.pay
    assert_equal (order.updated_at + 45.minutes).strftime('%l:%M %p'), order.arrival_time
  end

  def build_item
    create(:item)
  end
end
