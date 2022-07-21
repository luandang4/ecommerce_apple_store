class Admin::OrdersController < Admin::BaseController
  def index
    @q      = Order.ransack(params[:q])
    @orders = @q.result.page(params[:page]).per(15)
  end
end
