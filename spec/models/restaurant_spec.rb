require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  let(:restaurant) { create :restaurant }

  describe "with valid params" do
    it 'is valid' do
      expect(restaurant).to be_valid
    end

    it 'has a unique name' do
      create :restaurant
      expect { create :restaurant }.to raise_exception ActiveRecord::RecordInvalid
    end
  end
end
