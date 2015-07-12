class Admin::RestaurantsController < AdminController
  before_action :load_restaurant, only: [:show]

  def show
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
