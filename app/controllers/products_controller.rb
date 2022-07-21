class ProductsController < ApplicationController

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(12).product_residual

    @current_cart = current_user&.cart
  end

  def show
    @q = Product.ransack(params[:q])
    @product = Product.find(params[:id])

    @current_cart = current_user&.cart
  end
end
