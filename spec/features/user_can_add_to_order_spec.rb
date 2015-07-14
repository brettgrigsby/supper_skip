require_relative 'feature_spec_helper'

describe 'an order', type: :feature do
  let(:restaurant) { Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug') }
  let(:item) { restaurant.items.create!(title: 'myitem', description: 'a item', price: 5 ) }

  it 'starts with zero items' do
    visit restaurant_items_path(restaurant, item)
    visit cart_path

    expect(page).to have_content("You don't have any items in your cart!")
  end

  it 'can add an item' do
    item2 = restaurant.items.create!(title: 'myitem2', description: 'a item', price: 5)
    item2.categories.create(name: 'Appetizers')

    visit restaurant_items_path(restaurant, item)
    click_button("Add to Cart")
    visit cart_path

    expect(page).to have_content("myitem2")
  end

  it 'can remove an item' do
    item2 = restaurant.items.create!(title: 'item2', description: 'a item', price: 5)
    item2.categories.create(name: 'Appetizers')

    visit restaurant_item_path(restaurant, item2)
    click_button("Add to Cart")
    visit cart_path
    fill_in("quantity", with: "0") 
    click_button("Update")

    expect(page).not_to have_content("item2")
    expect(page).not_to have_content("Remove")
  end

  it 'can change an item quantity from the cart page' do

    item = restaurant.items.create!(title: 'item1', description: 'a item', price: 5)
    visit restaurant_item_path(restaurant, item)

    click_on("Add to Cart")
    visit cart_path

    expect(page).to have_content("Quantity")

    fill_in('quantity', with: 5)
    click_on('Update')

    expect(page).to have_selector("input[value='5']")
  end

  it 'increases quantity when adding repeat items to the order' do
    visit restaurant_item_path(restaurant, item)

    click_button("Add to Cart")
    visit restaurant_item_path(restaurant, item)
    click_button("Add to Cart")
    visit cart_path
    expect(page).to have_selector("input[value='2']")
  end

  it 'cannot have a negative quantity' do
    item = restaurant.items.create!(title: 'negative_item', description: 'a item', price: 5)
    visit restaurant_item_path(restaurant, item)
    click_button("Add to Cart")
    visit cart_path
    fill_in('quantity', with: -2)
    click_on('Update')
    expect(page).not_to have_selector("input[value='-2']")
  end

  it 'subtotals the price of each item in order' do
    restaurant = Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug')
    item1 = restaurant.items.create!(title: 'item1', description: 'a item', price: 100)

    visit restaurant_item_path(restaurant, item1)
    click_button("Add to Cart")
    visit restaurant_item_path(restaurant, item1)
    click_button("Add to Cart")

    visit cart_path
    expect(page).to have_content('$2.00')
  end

  it 'totals the price of all items in order' do
    item1 = restaurant.items.create!(title: 'totals_item', description: 'a item', price: 100)
    item2 = restaurant.items.create!(title: 'totals_item2', description: 'a item', price: 50)

    visit restaurant_item_path(restaurant, item1)
    click_button("Add to Cart")

    visit restaurant_item_path(restaurant, item2)
    click_on("Add to Cart")
    visit cart_path

    expect(page).to have_content('$1.50')
  end
end
