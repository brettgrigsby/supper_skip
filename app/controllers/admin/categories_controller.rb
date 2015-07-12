class Admin::CategoriesController < AdminController
  before_action :load_restaurant, only: [:new, :create]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.restaurant = @restaurant
    @category.save
    redirect_to admin_restaurant_path(@restaurant)
  end

  def category_params
    params.require(:category).permit(:name)
  end

  private

  def load_restaurant
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
  end
end
