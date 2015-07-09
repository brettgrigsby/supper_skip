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
end
