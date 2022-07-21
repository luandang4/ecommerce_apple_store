class Admin::UsersController < Admin::BaseController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
  end
end
