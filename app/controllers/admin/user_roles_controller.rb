class Admin::UserRolesController < AdminController
  before_action :load_restaurant

  def new
    @user_role = UserRole.new
  end

  def create
    binding.pry
  end
end
