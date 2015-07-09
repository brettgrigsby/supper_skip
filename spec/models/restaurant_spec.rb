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
    item_1 = create :item, title: "Item1"
    item_2 = create :item, title: "Item2"

    item_1.restaurants << restaurant
    item_2.restaurants << restaurant
restaurant
    assert item_1.restaurants.include?(restaurant)
    assert item_2.restaurants.include?(restaurant)
  end
end
