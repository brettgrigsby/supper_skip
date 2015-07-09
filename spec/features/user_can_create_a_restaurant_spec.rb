require_relative 'feature_spec_helper'

describe 'a new restaurant', type: :feature do
  before do
    User.create(first_name: "Jane",
      last_name: "Doe",
      email: "jane@jane.com",
      password: "password",
      role: "user")

    visit "/"
    first(:link, "Login").click

    fill_in("email address", :with => "jane@jane.com")
    fill_in("password", :with => "password")
    click_button("Login")
  end

  it 'has a create button' do
    expect(page).to have_link("Create A Restaurant")
  end

  it 'takes you to a restaurant create page' do
    click_link("Create A Restaurant")

    expect(page).to have_content("Create Your Restaurant")

    fill_in("restaurant name", with: "Dawg Pound")
    fill_in("description", with: "It's good to be in the dawg house!")
    fill_in("slug (optional)", with: "DawgyDawg")
    click_button("Make My Restaurant")

    expect(current_path).to eq('/restaurants/DawgyDawg')
  end
end
