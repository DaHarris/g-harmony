class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    log_in @user
      redirect_to root_path, notice: "Congratulations, User was successfully created!"
    else
      render :new
    end
  end

# Might need it later on
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end
end
