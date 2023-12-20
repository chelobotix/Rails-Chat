class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  # New
  def new
    @user = User.new
  end

  # Get -> Edit
  def edit; end

  # Post -> Create
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "New user #{@user.username} has been created"
      redirect_to(root_path)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  # Put -> Update
  def update
    puts('dentraaa classic')
    if @user.update(user_params)
      flash[:notice] = "User #{@user.username} has been updated"
      redirect_to(root_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  # get @user
  def set_user
    @user = User.find(params[:id])
  end

  # user params
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
