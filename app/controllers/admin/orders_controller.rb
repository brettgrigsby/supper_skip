class Admin::OrdersController < AdminController
  before_action :find_restaurant, only: [:index, :edit, :update, :new, :create]
  before_action :find_state

  def index
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
    @orders = Order.select(restaurant_id: @restaurant.id)
  end

  def show
    @user_order = Order.find(params[:id])
  end

  def edit
  end

  def update
#  @orders = Order.public_send filter
  end

  def run_event
    # user_order = Order.find(params[:id])
    # if user_order.aasm.may_fire_event? params[:event].to_sym # <-- to_sym exposes gc hack :/
    #   user_order.public_send "#{params[:event]}!" # <--  dynamic method invocation *sigh* fkn metaprogramming, y'all
    #  # user_order.public_method("#{params[:event]}!").call#.call('some_argument_1', 'some_argument_2')
    # end
    # redirect_to admin_restaurant_orders_path(@restaurant, scope: user_order.aasm_state)
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

  def find_state
  end

  private

  def order_params
    params.require(:order).permit(:workflow_state)
  end

end

