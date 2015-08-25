class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.active? && @user = login(params[:email], params[:password])
      redirect_back_or_to pins_path, notice: 'You have logged in successfully'
    else
      flash.now[:alert] = 'Incorrect email or password. Please login again.'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'You have successfully logged out'
  end

end
