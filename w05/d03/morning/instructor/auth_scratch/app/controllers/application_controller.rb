class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :logged_out?, :require_login, :log_in
  before_action :require_login

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    session[:user_id]
  end

  def logged_out?
    !logged_in?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def require_login
    redirect_to new_session_path if logged_out?
  end
end
