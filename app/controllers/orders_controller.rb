class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def edit
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



  def checkout
    @address = Address.find_by(order_id: order.id) || Address.create
  end

  # def confirm
  #   if order.basket?
  #     order.order!
  #   end
  #
  #   @address = Address.find_by(order_id: order)
  # end

  def paid
    if order.paid?
      order.payment_received!
    end
    session[:order_id] = nil
  end

  private

  def order_params
    params.require(:order).permit()
  end
end
