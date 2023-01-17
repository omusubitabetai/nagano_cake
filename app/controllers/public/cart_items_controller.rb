class Public::CartItemsController < ApplicationController
  def index
  end

  def create
    @cart_item = CartItem.new
    #次回作成時、このcreateアクションの中身を考えて記述する。会員の商品個別詳細のとこと繋がっている
  end


  def destroy
  end

  def update
  end
end
