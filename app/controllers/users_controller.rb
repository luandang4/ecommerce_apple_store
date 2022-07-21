class UsersController < ApplicationController
  def show
    @q            = Product.ransack(params[:q])
    @address      = current_user.delivery_addresses
    @current_cart = current_user.cart
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
      flash[:notice] = "Update profile success!"
    else
      @q       = Product.ransack(params[:q])
      @address = current_user.delivery_addresses
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :email, :name, :image, :phone, :gender)
  end
end
