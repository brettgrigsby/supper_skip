require_relative 'feature_spec_helper'

describe 'a restaurant', type: :feature do
  let(:restaurant) { Restaurant.create!(name: "Testaurant", description: "tastes funny", user_id: 1) }

  it 'has a show page with its info' do
    visit restaurant_path(restaurant)

    expect(page).to have_content("Testaurant")
    expect(page).to have_content("tastes funny")
  end

  xit 'can add an item' do
    item = create :item, title: "John"
    item.categories.create(name: 'Appetizers')

    visit items_path
    click_button("Add to Cart")
    visit order_path(current_order)

    expect(page).to have_content("John")
  end
end

