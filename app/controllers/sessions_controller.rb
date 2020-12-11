class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'loged in'
      redirect_to user_path(user.id)
    else
      redirect_to new_session_path flash[:notice] = 'failed login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path flash[:notice] = 'loged out'
  end
end
