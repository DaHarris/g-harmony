class UsersController < ApplicationController

  before_action :admin_user, only: [:edit, :update, :destroy, :index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if current_user.admin?
      @user.save
        redirect_to users_path
    elsif @user.save
      log_in @user
        redirect_to root_path, notice: "Congratulations, User was successfully created!"
    else
      @user.errors[:base] << "Please try again"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "User was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User was successfully destroyed!"
  end

# Might need it later on
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :admin)
  end
end
