class AddRestaurantIdToUserRoles < ActiveRecord::Migration
  def change
    add_reference :user_roles, :restaurant, index: true
  end
end
