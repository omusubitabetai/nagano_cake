class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def show
  end

  def new
  end

  def confirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0

  end

  def thanx
  end

  def create
  end

  def order_params
    params.permit(:payment_method, :address, :postal_code, :name)
  end

end
