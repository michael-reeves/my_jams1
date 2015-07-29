class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome, #{@user.first_name}"
      session[:user_id] = @user.id
      redirect_to @user #user_path(@user)
    else
      flash[:error] = "Unable to create user"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
                                 :username, :password)
  end
end
