class Public::ShippingAddressesController < ApplicationController
  def index
    @address = ShippingAddress.new
    @addresses = current_customer.shipping_addresses
  end

  def create
  	@address = ShippingAddress.new(address_params)
  	@address.customer_id = current_customer.id
  	@address.save
  	redirect_to public_shipping_addresses_path
  end

  def edit
    @address = ShippingAddress.find(params[:id])
  end

  def update
  	@address = ShippingAddress.find(params[:id])
  	@address.update(address_params)
  	redirect_to public_shipping_addresses_path
  end

  def destroy
  	@address = ShippingAddress.find(params[:id])
  	@address.destroy
  	redirect_to public_shipping_addresses_path
  end

  private
  def address_params
  	params.require(:shipping_address).permit(:name, :customer_id, :address, :postal_code)
  end

end
