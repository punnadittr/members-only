class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "LOGGED IN"
      log_in user
      cookies.permanent[:remember_token] = user.remember_digest
      redirect_to new_post_path
    else
      flash.now[:danger] = "Wrong!"
      render 'new'
    end
  end

  def destroy
  end

  def delete
    log_out
    redirect_to root_url
  end
end
