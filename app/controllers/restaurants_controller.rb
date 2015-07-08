class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find_by(slug: params[:id])
  end
end
