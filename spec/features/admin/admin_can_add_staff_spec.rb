require_relative '../feature_spec_helper'

describe 'admin adding staff', type: :feature do
  include AdminHelper
  before do
    Role.create!([{title: 'cook'}, {title: 'delivery'}])
    @user = User.create!(	first_name: "Brett", 
				last_name: "Grigsby", 
				email: "brett@mail.com", 
				password: "password")
    @user.roles.create(title: "admin")
    @restaurant = @user.restaurants.create!(	name: 'testRest', 
						description: 'passing or not', 
						slug: 'slug')
    @item = @restaurant.items.create!(title: 'myitem', description: 'a item', price: 5 )
    visit "/"
    first(:link, "Login").click

    fill_in("email address", :with => "brett@mail.com")
    fill_in("password", :with => "password")
    click_button("Login")
  end
 
  it 'sees an Add Staff button on the Admin Dashboard page' do
    visit admin_dashboard_path

    expect(page).to have_link("Add Staff")
  end

  it 'sees form to add users to staff after clicking add staff' do
    visit admin_dashboard_path
    click_link("Add Staff")

    expect(status_code).to eq(200)
    expect(current_path).to eq(new_admin_restaurant_user_role_path(@restaurant))
    expect(page).to have_field('email')
    expect(page).to have_button('Add To Staff')
  end

  it 'creates user user roles for registered users' do
    user = User.create!(first_name: 'Brett', last_name: 'Grigsby', email: 'brett@test.com', password: "password")
    visit new_admin_restaurant_user_role_path(@restaurant)
    fill_in 'email', with: 'brett@test.com'
    click_button 'Add To Staff'

    expect(current_path).to eq(admin_dashboard_path)
    binding.pry
    expect(user.roles.pluck(:title)).to include('cook')
  end
end
