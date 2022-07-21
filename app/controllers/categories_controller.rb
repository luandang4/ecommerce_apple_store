class CategoriesController < ApplicationController

  def index
    @q = Product.ransack(params[:q])
    @product_search = @q.result.page(params[:page]).per(12)
  end

  def show
    @q = Product.ransack(params[:q])
    @categories = Category.all
    @product_by_cate = Category.find(params[:id]).products.page(params[:page]).per(12)
  end
end
