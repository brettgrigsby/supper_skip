require_relative 'feature_spec_helper'

describe "a user visits our root page" do
  xit 'they should see restaurants' do
    visit root_path
   expect(page).to have_css("h1")
   expect(page).to have_css("h3")
  end
end
