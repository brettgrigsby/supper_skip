class CooksController < ApplicationController
  def update
    @order = Order.find(params[:id])
    if order.current_state == :ready_for_prep
      @order.in_queue!
      flash[:success] = "Order #{@order.id} preparation beginning"
      redirect_to :back
    else
      @order.processed!
      flash[:success] = "Order #{@order.id} preparation complete"
      redirect_to :back
    end
  end
end


