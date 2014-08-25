require_relative '../feature_spec_helper'

describe 'admin edits an item', type: :feature do
  before do
    admin = create(:user)
    visit login_path
    fill_in 'email address', :with => admin.email
    fill_in 'password', :with => admin.password
    click_button("Login")
  end

  it 'edits a menu item' do
    item = create :item, :title => "hi"

    visit '/admin_dashboard'
    click_link 'View Menu Items'
    first(:link, "Edit Item").click
    fill_in "Title", with: "NewTitle"
    fill_in "Description", with: "NewDescription"
    fill_in "Price", with: 100.00
    click_button "Update Item"

    expect(page).to have_content "NewTitle"
    expect(page).not_to have_content "hi"
  end
end
