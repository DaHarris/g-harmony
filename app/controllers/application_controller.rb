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
  end


  def can_change(post)
    if current_user.monitor? || current_user.admin? || current_user.posts.find_by_id(post.id)
      true
    else
      false
    end
  end

  def logged_in?
    if current_user.nil?
      redirect_to login_path
    end
  end

  helper_method :logged_in?

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
