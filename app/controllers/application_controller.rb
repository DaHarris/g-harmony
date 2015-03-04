class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  helper_method :current_user

  def admin_user
    return unless !current_user.admin?
    redirect_to login_path
    # @user = User.find_by(username: params[:username])
    # if @user && @user.authenticate(params[:admin])
    # else
    #   redirect_to login_path
    # end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
