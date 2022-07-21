class AddressesController < ApplicationController
  def new
    @q = Product.ransack(params[:q])
    @address = DeliveryAddress.new
    @current_cart = current_user.cart
  end

  def create
    @q = Product.ransack(params[:q])
    @address = current_user.delivery_addresses.new(address_params)
    if @address.save
      redirect_to current_user
      flash[:notice] = "Create address success!"
    else
      render :new
    end
  end

  def edit
    @q = Product.ransack(params[:q])
    @address = current_user.delivery_addresses.find(params[:id])
  end

  def update
    @q = Product.ransack(params[:q])
    @address = current_user.delivery_addresses.find(params[:id])
    if @address.update(address_params)
      redirect_to current_user
      flash[:notice] = "Update address success!"
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:delivery_address).permit(:name, :phone, :address)
  end
end
