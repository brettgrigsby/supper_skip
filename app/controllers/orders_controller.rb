class OrdersController < ApplicationController
  after_action :clear_paid, only: [:paid]

  helper_method :orders_grand_total

  def orders_grand_total
    @orders.reduce(0) do |sum, order|
      sum + order.total
    end.to_f / 100
  end

  def index
    @orders = Order.all
  end

  def new
  end

  def show
  end

  def edit
  end

  def paid
    @orders = []
    session[:paid].each do |order_id|
      @orders << Order.find(order_id)
    end
  end

  def create
    session[:paid] = []
    @cart.sort_orders.each do |restaurant_id, order_items|
      order = Order.create!(user: current_user, restaurant_id: restaurant_id)
      order_items.each do |item, quantity|
        order.order_items.create(item_id: item.id, quantity: quantity)
      end
      session[:paid] << order.id
    end

    @cart.clear
    session[:cart] = @cart.contents
    redirect_to '/paid'
  end

  def add_item
    item = Item.find(params[:item_id])
    order.add_item(item)
    redirect_to order
  end

  def destroy
    order.destroy
    redirect_to root_path
  end

  def checkout
    @address = Address.find_by(order_id: order.id) || Address.create
  end

  private

  def order_params
    params.require(:order).permit()
  end

  def clear_paid
    session[:paid] = []
  end
end
