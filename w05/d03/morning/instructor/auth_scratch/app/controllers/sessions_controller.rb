class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(email: params["sessions"]["email"])
    if user && user.authenticate(params["sessions"]["password"])
      log_in(user)
      redirect_to users_path
    else
      raise "Wrong password!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
