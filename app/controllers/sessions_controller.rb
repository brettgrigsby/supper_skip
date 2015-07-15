class SessionsController < ApplicationController
  def new
  end

  def staff_signup
  end

  def staff_verify
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_user edit_user_path(@user)
    else
      flash.now[:error] = 'Invalid email/password combination'
      rendirect_to :back
    end
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      if @user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to @user
      end
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
