class Admin::OrdersController < AdminController
  def index
    filter = known_scopes.find(-> { :all }) { |scope_name| scope_name == params[:scope] }
    @orders = Order.public_send filter
   # @orders = @restaurant.orders.public_send filter
   # @orders = Order.find_by(restaurant_id: @restaurant.id)
  end

  def show
    @user_order = Order.find(params[:id])
  end

  def run_event
    user_order = Order.find(params[:id])
    if user_order.aasm.may_fire_event? params[:event].to_sym # <-- to_sym exposes gc hack :/
      user_order.public_send "#{params[:event]}!" # <--  dynamic method invocation *sigh* fkn metaprogramming, y'all
     # user_order.public_method("#{params[:event]}!").call#.call('some_argument_1', 'some_argument_2')
    end
    redirect_to admin_orders_path(scope: user_order.aasm_state)
  end

  def delete_item
    item = Item.find(params[:item_id])
    @order = Order.find(params[:id])
    @order.remove_item(item)
    redirect_to admin_order_path(@order.id)
  end

  private

  def known_scopes
    @known_scopes ||= Order.aasm.states.map { |state| state.name.to_s }
  end
end
