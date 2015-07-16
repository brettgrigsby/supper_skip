require 'rails_helper'

RSpec.describe Order, :type => :model do

  let(:restaurant) { Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug') }
  let(:item) { restaurant.items.create!(title: 'myitem', description: 'a item', price: 5 ) }
  let(:item2) { restaurant.items.create!(title: 'myitem2', description: 'a 2nd item', price: 5 ) }
  let(:order) { restaurant.orders.create!(delivery: true) }

  it "belongs to one user" do
    user = User.new
    order.user_id = user.id
    expect(order.user_id).to eq(user.id)
  end

  it 'is valid' do
    expect(order).to be_valid
  end

  it 'is valid with delivery designated as false' do
    refute(order.delivered?)
    expect(order).to be_valid
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

  it 'tells arrival time on creation' do
    order.ready_for_prep?
    assert_equal (order.updated_at + 45.minutes).strftime('%l:%M %p'), order.arrival_time
  end

  def build_item
    create(:item)
  end
end
