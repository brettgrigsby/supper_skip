class Admin::OrdersController < AdminController
  before_action :find_restaurant, only: [:index, :edit, :update, :new, :create]

  def index
    #@restaurant = Restaurant.find_by(slug: params[:restaurant_id])
    @orders = @restaurant.orders
  end

  def show
    @user_order = Order.find(params[:id])
  end

  def edit

  end


  def update
    @order = Order.find(params[:id])
    if @order.can_cancel?
      @order.cancel!
      flash[:success] = "Order: #{@order.id} has been #{@order.current_state}"
      redirect_to admin_restaurant_orders_path(@order.restaurant)
    else
      flash[:failure] = "Order: #{@order.id} cannot be cancelled}"
      redirect_to :back
    end
  end

  def find_restaurant
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
  end

  private

    def order_params
      params.require(:order).permit(:workflow_state)
    end
end

