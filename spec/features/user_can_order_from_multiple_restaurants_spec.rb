require_relative 'feature_spec_helper'

describe 'an order', type: :feature do
  let(:restaurant1) { Restaurant.create!(name: 'testRest1', description: 'passing or not', slug: 'slug1') }
  let(:item1) { restaurant1.items.create!(title: 'myitem1', description: 'a item1', price: 5 ) }
  let(:restaurant2) { Restaurant.create!(name: 'testRest2', description: 'passing or not', slug: 'slug2') }
  let(:item2) { restaurant2.items.create!(title: 'myitem2', description: 'a item2', price: 5 ) }

 it 'can add items from two different restaurants' do
    visit restaurant_item_path(restaurant1, item1)
    click_button("Add to Cart")
    visit restaurant_item_path(restaurant2, item2)
    click_button("Add to Cart")
    visit cart_path
 
    expect(page).to have_content("myitem1")
    expect(page).to have_content("myitem2")
  end
end
