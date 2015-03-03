class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      log_in @user
      redirect_to root_path, notice: "User was successfully Logged In!"
    else
      @user.errors[:base] << "User/Password incorrect"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: "User was successfully Signed Out"
  end

end
