class Admin::OrdersController < AdminController
  before_action :find_restaurant, only: [:index, :edit, :update, :new, :create]

  def index
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])

    @orders = Order.all.select { |order| order.restaurant_id == @restaurant.id }
  end

  def show
    @user_order = Order.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete_item
    item = Item.find(params[:item_id])
    @order = Order.find(params[:id])
    @order.remove_item(item)
    redirect_to admin_restaurant_order_path(@restaurant, @order.id)
  end

  def find_restaurant
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
  end


  private

  def order_params
    params.require(:order).permit(:workflow_state)
  end
end

