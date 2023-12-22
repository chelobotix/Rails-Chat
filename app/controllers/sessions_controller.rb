class SessionsController < ApplicationController
  before_action :already_singed_up, only: %i[new create]

  # get -> new
  def new; end

  # get -> create
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to(root_path)
    else
      flash.now[:alert] = 'Incorrect credentials'
      render(:new, status: :unprocessable_entity)
    end
  end

  # delete -> destroy
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(root_path)
  end
end
