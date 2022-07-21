class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Product.ransack(params[:q])
    @current_cart = current_user.cart
    @cart_items = @current_cart.nil? ? nil : @current_cart.cart_items.includes(:product).latest
    @total_payment = total_payment
  end
end
