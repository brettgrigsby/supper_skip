require_relative '../feature_spec_helper'

describe 'cook', type: :feature do

  let(:cook) { FactoryGirl.create(:user) }
  let(:order) { FactoryGirl.create(:order) }
  let(:restaurant) { FactoryGirl.create(:restaurant) }
  before do
    cook.roles.create(title: "cook")
    cook.save!

    visit login_path

    fill_in 'email address', :with => cook.email
    fill_in 'password',      :with => cook.password

    click_button("Login")
  end

  it 'can mark an order as being prepaired' do
    click_link 'Begin Preparation'

    expect(page).to_not have_link('Begin Preparation')
    expect(page).to have_link('Preparation Complete')
  end

  it 'can mark an order as done cooking'

end

