class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end
  def show
    @restaurant = Restaurant.find_by(slug: params[:id])
  end
end
