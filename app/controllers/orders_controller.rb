class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
    @cart.sort_orders.each do |restaurant_id, order_items|
      order = Order.create!(user: current_user, restaurant_id: restaurant_id)
      order_items.each do |item, quantity|
        order.order_items.create(item_id: item.id, quantity: quantity)
      end
    end
    @cart.clear
    session[:cart] = @cart.contents
    redirect_to current_user
  end

  def add_item
    item = Item.find(params[:item_id])
    order.add_item(item)
    redirect_to order
  end

  def delete_item
    item = Item.find(params[:item_id])
    order.remove_item(item)
    redirect_to order
  end

  def destroy
    order.destroy
    redirect_to root_path
  end

  def order_params
    params.require(:order).permit()
  end

  def checkout
    @address = Address.find_by(order_id: order.id) || Address.create
  end

  def confirm
    if order.basket?
      order.order!
    end

    @address = Address.find_by(order_id: order)
  end

  def paid
    if order.ordered?
      order.pay!
    end
    session[:order_id] = nil
  end
end
