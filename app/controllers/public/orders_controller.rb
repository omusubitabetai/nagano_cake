class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    #@order.payment_method = params[:order][:payment_method].to_i
    @order.shipping_cost = 800
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order.total_payment = 0
  end

  def thanx
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.status = 0
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.price*1.1.floor*cart_item.amount
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to public_orders_thanx_path
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name, :shipping_cost, :total_payment)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end
