require_relative 'feature_spec_helper'

describe 'registered user creates a new restaurant', type: :feature do
  include AdminHelper

  before do
    @user =  create :user
    visit "/"
    first(:link, "Login").click
  end

  it 'with a link from their show page' do
    log_me_in!
    visit user_path(@user)

    expect(page).to have_link("Create New Restaurant")
  end
end
