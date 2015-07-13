class Admin::OrdersController < AdminController
  before_action :find_restaurant, only: [:index, :edit, :update, :new, :create]

  def index
    filter = known_scopes.find(-> { :all }) { |scope_name| scope_name == params[:scope] }
    @orders = Order.public_send filter
    ## think restaurant_id needs to be in here
   # @orders = Order.select { |orders| orders.restaurant_id == @restaurant.id }
  end

  def show
    @user_order = Order.find(params[:id])
  end

  def edit

  end
  def update
    @orders = Order.public_send filter
  end

  def run_event
    user_order = Order.find(params[:id])
    if user_order.aasm.may_fire_event? params[:event].to_sym # <-- to_sym exposes gc hack :/
      user_order.public_send "#{params[:event]}!" # <--  dynamic method invocation *sigh* fkn metaprogramming, y'all
     # user_order.public_method("#{params[:event]}!").call#.call('some_argument_1', 'some_argument_2')
    end
    redirect_to admin_restaurant_orders_path(@restaurant, scope: user_order.aasm_state)
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

  def known_scopes
    @known_scopes ||= Order.aasm.states.map { |state| state.name.to_s }
  end
end
