class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user &.authenticate(params[:session][:password])
      forwading_url = session[:forwading_url]
      reset_session
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      log_in user
      redirect_to forwading_url || user
    else
      flash.now[:danger] = 'Invalid email/password comination'
      render 'new', status: :unprocessable_entity  
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end
end