require 'securerandom'

class Admin::UserRolesController < AdminController
  before_action :load_restaurant
  before_action :load_user, only: [:create]
  before_action :load_role, only: [:create]

  def new
    @user_role = UserRole.new
  end

  def create
    create_staff_user unless @user
    UserRole.create(user: @user, role: @role, restaurant: @restaurant)
    @user.roles << user_role
    flash[:success] = "Staff Member Added!"
    redirect_to admin_dashboard_path
  end

  private

  def load_user
    @user = User.find_by(email: params[:email])
  end

  def load_role
    @role = Role.find_by(title: params[:role])
  end

  def create_staff_user
    @password = SecureRandom.urlsafe_base64(8)
    @user = User.create(first_name: 'first name',
			last_name: 'last name',
                	password: @password,
			email: params[:email])
    UserMailer.invite_user(@user, @password).deliver
  end
end
