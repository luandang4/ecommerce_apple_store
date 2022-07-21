class Admin::CategoriesController < Admin::BaseController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)
    if @category.save
      redirect_to admin_categories_path
      flash[:success] = "Create category success!"
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    Category.find(params[:id]).destroy
    @q = Category.ransack(params[:q])
    @categories = @q.result.page(params[:page]).per(15)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_param)
      flash[:success] = "Update success!"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def show
    @categories = Category.all
    @product_by_cate = Category.find(params[:id]).products.page(params[:page]).per(12)
  end

  private
  def category_param
    params.require(:category).permit(:name)
  end
end
