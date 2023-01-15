class Public::ItemsController < ApplicationController
  def index
    @total_items = Item.all
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private
  def items_params
    parmas.require(:item).permit(:name, :introduction, :price, :is_active, :item_id)
  end
end
