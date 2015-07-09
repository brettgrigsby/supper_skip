class RestaurantsController < ApplicationController
  before_action :load_restaurant, only: [:show, :edit]

  def index
    @restaurants = Restaurant.all
  end

  def show

  end

  def edit

  end    

  private

  def load_restaurant
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
