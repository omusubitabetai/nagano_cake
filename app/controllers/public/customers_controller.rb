class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def quit
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted:true)
    reset_session
    redirect_to new_customer_registration_path
  end

  def update
  end
end
