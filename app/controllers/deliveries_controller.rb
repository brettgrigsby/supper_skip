class DeliveriesController < ApplicationController
  def update
    @order = Order.find(params[:id])
    if order.current_state == :ready_for_prep
      @order.in_queue!
      flash[:success] = "Order #{@order.id} out for delivery"
      redirect_to :back
    else
      @order.processed!
      flash[:success] = "Order #{@order.id} delivery complete"
      redirect_to :back
    end
  end
end

