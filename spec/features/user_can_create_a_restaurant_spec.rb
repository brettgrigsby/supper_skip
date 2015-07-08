require_relative 'feature_spec_helper'

describe 'a new restaurant', type: :feature do

  it 'can be created' do
    create :user
    visit "/"
    first(:link, "Login").click

    fill_in("email address", :with => "j@example.com")
    fill_in("password", :with => "123456789")
    click_button("Login")

    expect(page).to have_content("Create A Restaurant")
  end
end
