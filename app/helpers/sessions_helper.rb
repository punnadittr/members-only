module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    cookies.delete(:remember_token)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(remember_digest: cookies.permanent[:remember_token])
  end

  def require_login
    unless logged_in?
      flash[:danger] = "You must login to make a new post"
      redirect_to login_path
    end
  end
end
