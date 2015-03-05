class UsersController < ApplicationController

  before_action :admin_user, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = false
    if current_user && current_user.admin?
      @user.save
        redirect_to users_path
    elsif @user.save
      log_in @user
        redirect_to root_path, notice: "Congratulations, User was successfully created!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id || current_user.admin || current_user.monitor
    else
      redirect_to root_path, notice: "Cannot access resource."
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id || current_user.admin || current_user.monitor
      if @user.update(user_params)
        if current_user.admin
          redirect_to users_path, notice: "User was successfully updated!"
        else
          redirect_to root_path, notice: "User was successfully updated!"
        end
      else
        render :edit
      end
    else
      redirect_to root_path, notice: "Cannot access resource."
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id || current_user.admin
      @user.destroy
      if current_user && current_user.admin
      else
        session[:user_id] = nil
      end
      if current_user && current_user.admin
        redirect_to users_path, notice: "User was successfully destroyed!"
      else
        redirect_to login_path, notice: "User was successfully destroyed!"
      end
    else
      redirect_to root_path, notice: "Cannot access resource."
    end
  end

# Might need it later on
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :admin, :monitor)
  end
end
