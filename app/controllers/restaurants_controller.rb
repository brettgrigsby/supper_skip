class RestaurantsController < ApplicationController
  before_action :load_restaurant, only: [:show, :edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def edit
    unless current_user.restaurants.include?(@restaurant)
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:success] = "#{@restaurant.name} updated!"
      redirect_to @restaurant
    else
      flash.now[:errors] = "failed to update"
      render :edit
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    create_slug if @restaurant.slug.empty?
    @restaurant.user = current_user
    if @restaurant.save
      current_user.role = 'admin'
      current_user.save(validate: false)
      flash[:success] = "You have created #{@restaurant.name}"

      redirect_to restaurant_path(@restaurant)
    else
      flash[:failure] = "There was a problem creating #{@restaurant.name}"
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :slug)
  end

  def load_restaurant
    @restaurant = Restaurant.find_by(slug: params[:id])
  end

  def create_slug
    @restaurant.slug = @restaurant.name.parameterize
  end
end
