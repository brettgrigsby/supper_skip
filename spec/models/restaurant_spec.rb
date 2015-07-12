require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  let(:restaurant) { create :restaurant }
  let(:item) { create :item }
  let(:order) { create :order }

  it 'is valid' do
    expect(restaurant).to be_valid
  end

  it 'has a unique name' do
    create :restaurant
    expect { create :restaurant }.to raise_exception ActiveRecord::RecordInvalid
  end

  it 'has a unique slug' do
    create :restaurant
    expect { create :restaurant, :name => "dogdog" }.to raise_exception ActiveRecord::RecordInvalid
  end

  it 'is not valid without a description' do
    expect { create :restaurant, :description => nil }.to raise_exception ActiveRecord::RecordInvalid
  end

  it 'has many items' do
    restaurant = create :restaurant

    item1 = restaurant.items.create!(title: "Item1", description: "desc1", price: 5.95)
    item2 = restaurant.items.create!(title: "Item2", description: "desc2", price: 9.99)

    assert restaurant.items.include?(item1)
    assert restaurant.items.include?(item2)
  end
end
