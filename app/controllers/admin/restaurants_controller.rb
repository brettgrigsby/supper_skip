class Admin::RestaurantsController < AdminController
  before_action :load_restaurant, only: [:create, :show]
  before_action :check_user, only: [:show]

  def show
    @item = Item.find_by(restaurant_id: params[:restaurant_id])
   # @item = Item.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    create_slug if @restaurant.slug.empty?
    @restaurant.user = current_user
    if @restaurant.save
      current_user.role = 'admin'
      current_user.save(validate: false)
      flash[:success] = "You have created #{@restaurant.name}"

      redirect_to admin_restaurant_path(@restaurant)
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
