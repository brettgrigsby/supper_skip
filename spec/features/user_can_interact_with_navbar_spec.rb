require_relative 'feature_spec_helper'

describe "the navbar", type: :feature do
  it "has buttons" do
    visit "/"
    expect(page).to have_link("No Soup For You")
  end

  it "has a menu link" do
    visit "/"
    expect(page).to have_link("Menu")
    click_link("Menu")
    expect(current_path).to eq("/menu")
  end

  it "has a My Order link" do
    visit "/"
    expect(page).to have_link("My Order")
    click_link("My Order")
    expect(current_path).to eq("/orders/1")
  end
end
