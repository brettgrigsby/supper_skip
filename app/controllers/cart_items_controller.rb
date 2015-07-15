class CartItemsController < ApplicationController
  before_action(:set_cart_items, only: [:create])

  def create
    @cart.add_item(@item.id)
    set_cart
    flash[:success] = "#{@item.title} added to your cart"
    redirect_to :back
  end

  def update
    if params[:quantity].to_i > 0
      @cart.contents[params[:item_id]] = params[:quantity].to_i
    else
      @cart.contents.delete(params[:item_id])
    end
    set_cart
    flash[:success] = "your cart has been updated"
    redirect_to cart_path
  end

  private

  def set_cart
    session[:cart] = @cart.contents
  end

  def set_cart_items
    @item = Item.find_by(id: params[:item_id])
  end
end

