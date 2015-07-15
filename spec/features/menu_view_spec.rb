# require_relative 'feature_spec_helper'
#
# describe 'the menu view', type: :feature do
#     let(:restaurant) { Restaurant.create(name: 'testRest', description: 'passing or not') }
#     let(:item) { restaurant.items.create(title: 'myitem', description: 'a item', price: 5 ) }
#
#   xit 'shows a list of items' do
#     item_1 = create :item, :title => "food"
#     item_2 = create :item, :description => "expensive"
#
#     Items currently displayed by category, so no category = no items :o
    # item_1.categories.create(name: "Appetizers")
    # item_2.categories.create(name: "Lunch")
    #
    # visit '/menu'
    # expect(page).to have_content('food')
    # expect(page).to have_content('expensive')
  # end
  #
  # xit 'views items by category' do
  #   item_1 = create :item, :title => "MyTitle"
  #   item_2 = create :item
  #   item_1.categories.create(name: "Appetizers")
  #   item_2.categories.create(name: "Lunch")
  #
  #   visit '/menu'
  #   page.click_on('Appetizers')
  #   expect(current_path).to eq('/menu')
  #   expect(page).to have_content("MyTitle")
  # end
# end
