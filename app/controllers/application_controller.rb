class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  # current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # logged_in?
  def logged_in?
    !!current_user
  end

  # require_user
  def require_user
    unless logged_in?
      flash[:alert] = 'You must be logged in to view this page'
      redirect_to(login_path)
    end
  end
end
