class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  def require_login
  		return if @current_user
  		flash[:danger] = "login first"
  		redirect_to root_path
  end

  def admin_require_login
      return if @current_user.try(:type) == "Admin"
      flash[:danger] = "login first"
      redirect_to users_admin_path
  end

  def set_current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  

end
