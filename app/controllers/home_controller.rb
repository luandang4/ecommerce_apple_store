class HomeController < ApplicationController
  def index
    @categories = Category.all
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(12).product_residual
    if current_user.present?
      @current_cart = current_user.cart
    else
      @current_cart = Cart.new
    end
  end
end
