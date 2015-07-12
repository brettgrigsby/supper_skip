require_relative 'feature_spec_helper'

describe 'an order', type: :feature do
  let(:current_order) { Order.create!(delivery: true) }
  let(:restaurant) { Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug') }
  let(:item) { restaurant.items.create!(title: 'myitem', description: 'a item', price: 5 ) }

  it 'starts with zero items' do
    visit restaurant_items_path(restaurant, item)
    visit order_path(current_order)

    expect(page).to have_content("You don't have any items in your cart!")
  end

  it 'can add an item' do
    # item = create :item, title: "John"
    item2 = restaurant.items.create!(title: 'myitem2', description: 'a item', price: 5)
    item2.categories.create(name: 'Appetizers')

    visit restaurant_items_path(restaurant, item)
    click_button("Add to Cart")
    visit order_path(current_order)

    expect(page).to have_content("myitem2")
  end

  it 'can remove an item' do
    #item = create :item, title: "John"
    item2 = restaurant.items.create!(title: 'item2', description: 'a item', price: 5)
    item2.categories.create(name: 'Appetizers')

    visit restaurant_item_path(restaurant, item2)
    click_button("Add to Cart")
    visit order_path(current_order)
    click_button("Remove")

    expect(page).not_to have_content("item2")
    expect(page).not_to have_content("Remove")
  end

  xit 'can change an item quantity from the order page' do

    item = restaurant.items.create!(title: 'item1', description: 'a item', price: 5)
    visit restaurant_item_path(restaurant, item)

    page.find(:xpath, "(//div[@class='caption'])[1]").click_on("Add to Cart")
    visit order_path(current_order)

    expect(page).to have_content("Quantity")

    fill_in('item[quantity]', with: 200)
    click_on('Update')

    expect(page).to have_selector("input[value='200']")
  end

  it 'increases quantity when adding repeat items to the order' do
    visit restaurant_item_path(restaurant, item)

    click_button("Add to Cart")
    visit restaurant_item_path(restaurant, item)
    click_button("Add to Cart")

    expect(page).to have_selector("input[value='2']")
  end

  it 'cannot have a negative quantity' do
    item = restaurant.items.create!(title: 'negative_item', description: 'a item', price: 5)
   # item = Item.create!(title: 'John', description: 'Doe', price: 100)
    visit restaurant_item_path(restaurant, item)
    click_button("Add to Cart")
    fill_in('item[quantity]', with: -2)
    click_on('Update')
    expect(page).to have_selector("input[value='1']")
  end

  it 'cannot exceed max quantity' do
    item = restaurant.items.create!(title: 'max_item', description: 'a item', price: 5)
    #item = Item.create!(title: 'John', description: 'Doe', price: 100)
    visit restaurant_item_path(restaurant, item)
    click_button("Add to Cart")
    fill_in('item[quantity]', with: 6000)
    click_on('Update')
    expect(page).to have_content("There aren't enough of that animal left!")
  end

  it 'subtotals the price of each item in order' do
  current_order = Order.create!(delivery: true)
  restaurant = Restaurant.create!(name: 'testRest', description: 'passing or not', slug: 'slug')
  item1 = restaurant.items.create!(title: 'item1', description: 'a item', price: 100)


  #  visit restaurant_path(restaurant)
    visit restaurant_item_path(restaurant, item1)
    find('.item1').click
    visit restaurant_item_path(restaurant, item1)
    find('.item1').click

    visit order_path(current_order)
    expect(page).to have_content('$2.00')
  end

  it 'totals the price of all items in order' do
    item1 = restaurant.items.create!(title: 'totals_item', description: 'a item', price: 100)
    item2 = restaurant.items.create!(title: 'totals_item2', description: 'a item', price: 50)
    item1.categories.create!(name: 'Appetizers')
    item2.categories.create!(name: 'Appetizers')

    visit restaurant_items_path(restaurant, item)

    page.find(:xpath, "(//div[@class='caption'])[1]").click_on("Add to Cart")

    visit restaurant_items_path(restaurant, item)
    page.find(:xpath, "(//div[@class='caption'])[2]").click_on("Add to Cart")

    expect(page).to have_content('$1.50')
  end

    it "can destroy an order" do
    item = create :item
    item.categories.create(name: 'Appetizers')

    visit restaurant_items_path(restaurant, item)
    click_button("Add to Cart")
    visit order_path(current_order)

    click_button("Remove")

    expect(page).to have_content("You don't have any items in your cart!")
  end
end
