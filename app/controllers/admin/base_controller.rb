class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  layout "layouts/admin/dashboard"

  private

  def verify_admin
    return if current_user.admin?
    flash[:notice] = "You not are admin!"
    redirect_to root_path
  end
end
