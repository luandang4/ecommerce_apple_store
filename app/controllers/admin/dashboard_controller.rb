class Admin::DashboardController < Admin::BaseController
  def index
    @product    = Product.all
    @user       = User.all
    @orders     = Order.all
    @order_item = OrderItem.all
    @q      = Order.ransack(params[:q])
    @orders = @q.result.page(params[:page]).per(15)
  end
end
