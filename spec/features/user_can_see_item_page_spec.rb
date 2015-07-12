require_relative 'feature_spec_helper'

describe 'an items show page', type: :feature do
  let(:current_order) { Order.create!(delivery: true) }
  let(:restaurant) { Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug') }
  let(:item) { restaurant.items.create!(title: 'myitem', description: 'a item', price: 5 ) }

  it 'has a show page for an item' do
    visit restaurant_item_path(restaurant, item)
    expect(page.status_code).to eq(200)
    expect(current_path).to eq(restaurant_item_path(restaurant, item))
    expect(page).to have_content("myitem")
  end

  it "has an add to order button" do
    # restaurant = Restaurant.create(name: 'asdf', description: 'asdfasdf')
    # item = restaurant.items.create(title: 'myitem', description: 'a', price: 5 )
    visit restaurant_item_path(restaurant, item)
    expect(page).to have_button('Add to Cart')
  end

  it "can see an extinct item" do
    # restaurant = Restaurant.create(name: 'asdf', description: 'asdfasdf')
    # item = restaurant.items.create(title: 'myitem', description: 'a', price: 5 )
    Item.extinction(item)
    visit restaurant_item_path(restaurant, item)
    expect(page).to_not have_button('Add to Cart')
  end

    it "cannot visit a page with no action" do
    visit "/dfghjk"
    expect(page).to have_content("scurry")
  end
end
