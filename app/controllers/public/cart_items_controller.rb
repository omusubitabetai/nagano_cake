class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = CartItem.new
    @cart_item.customer_id = current_customer.id
    redirect_to public_cart_items_path
  end


  def destroy
  end

  def update
  end
end