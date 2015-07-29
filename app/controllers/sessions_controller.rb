class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login succeeded...."
      redirect_to @user
    else
      flash[:error] = "Login unsuccessful!"
      render 'new'
    end
  end

  def destroy
    # session[:user_id] = nil
    session.clear
    flash[:notice] = "You are now logged out."
    redirect_to root_path
  end

end
