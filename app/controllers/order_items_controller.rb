class OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])

    if quantity_params != '0'
      @order_item.update_attribute(:quantity, quantity_params)
      redirect_to order
    else
      @order_item.destroy
      redirect_to order
    end
  end

  def quantity_params
    result = @order_item.quantity_update(params[:item][:quantity])

    if result != nil
      result
    else
      flash[:toomany] = "There aren't enough of that animal left!"
      params[:item][:quantity] = 1
    end
  end
end
