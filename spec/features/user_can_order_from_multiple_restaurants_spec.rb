require_relative 'feature_spec_helper'

describe 'an order', type: :feature do
  let(:current_order) { Order.create!(delivery: true) }
  let(:restaurant) { Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug') }
  let(:item) { restaurant.items.create!(title: 'myitem', description: 'a item', price: 5 ) }

  it 'starts with zero items' do
    visit restaurant_items_path(restaurant, item)
    visit cart_path

    expect(page).to have_content("You don't have any items in your cart!")
  end

 xit 'can add items from two different restaurants' do
    item = create :item, title: "shrip"
    item.categories.create(name: 'Appetizers')

    visit restaurant_items_path(restaurant, item)
    click_button("Add to Cart")
     visit order_path(current_order)

    expect(page).to have_content("John")
  end
end
