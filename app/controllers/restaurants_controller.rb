class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by(slug: params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "You have created #{@restaurant.name}"
      redirect_to restaurant_path(@restaurant)
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :slug)
  end
end
