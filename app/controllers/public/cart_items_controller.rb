class Public::CartItemsController < ApplicationController
  def index
  end

  def create
    @cart_item = CartItem.new
  end


  def destroy
  end

  def update
  end
end
