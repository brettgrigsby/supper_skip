class Admin::CategoriesController < AdminController
  before_action :load_restaurant, only: [:new, :create, :edit, :update]
  before_action :find_category, only: [:edit, :update]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.restaurant = @restaurant
    @category.save
    redirect_to admin_restaurant_path(@restaurant)
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "#{@category.name} updated!"
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:errors] = "failed to update"
      render :edit
    end
  end

  private

  def load_restaurant
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
