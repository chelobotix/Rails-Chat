class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

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

  # already_singed_up
  def already_singed_up
    if logged_in?
      flash[:alert] = 'You have already signed up'
      redirect_to(root_path)
    end
  end
end
