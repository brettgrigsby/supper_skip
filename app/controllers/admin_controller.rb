class AdminController < ApplicationController
  before_action :authorize

  def index
  end

  def show
  end

  private

  def authorize
    unless current_user.role == "admin" || current_user.roles.pluck(:title).include?("admin")
      redirect_to "https://www.youtube.com/watch?v=4dGOfFbzvq4&t=0m45s" 
    end
  end

  def check_user
    unless current_user.restaurants.include?(@restaurant)
      render :file => 'public/404.html', :status => :not_found
    end
  end
end
