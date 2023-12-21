class SessionsController < ApplicationController
  # get -> new
  def new; end

  # get -> create
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user&.authenticate([:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to(root_path)
    else
      flash.now[:alert] = 'Incorrect credentials'
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy; end
end
