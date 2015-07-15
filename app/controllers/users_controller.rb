class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    redirect_to root_path unless current_user
  end
  def create
    @user = User.new(user_params)
    @user.roles << user_role
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to Endangered Eats!'
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
      params.require(:user).permit(:first_name, :last_name,
                                   :username,   :email,
                                   :password,   :password_confirmation)
  end
end
