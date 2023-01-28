class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method].to_i
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
  end

  def thanx
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to public_orders_thanx_path
  end

  private
  
  def order_params
    params.permit(:payment_method, :address, :postal_code, :name)
  end

end
