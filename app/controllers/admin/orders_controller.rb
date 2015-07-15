class Admin::OrdersController < AdminController
  before_action :find_restaurant, only: [:index, :edit, :update, :new, :create]

  def index # do not delete either of these
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
    @orders = @restaurant.orders
  end

  def show
    @user_order = Order.find(params[:id])
  end

  def edit
  end

  def update # this works to cancel the order
    @order = Order.find(params[:id])
    if params['data-action'] == 'cancel'
      @order.cancel! if @order.can_cancel?
      redirect_to admin_restaurant_orders_path(@order.restaurant_id)
    # else
      # item = Item.find(params[:item_id])
      # @order = Order.find(params[:id])
      # @order.remove_item(item)
      # redirect_to admin_restaurant_order_path(@restaurant, @order.id)
    end
  end

  # def delete_item
  #   item = Item.find(params[:item_id])
  #   @order = Order.find(params[:id])
  #   @order.remove_item(item)
  #   redirect_to admin_restaurant_order_path(@restaurant, @order.id)
  # end

  def find_restaurant
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
  end


  private

  def order_params
    params.require(:order).permit(:workflow_state)
  end
end

