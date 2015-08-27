class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :deactivate]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login @user
      redirect_to pins_path, notice: 'Thank you for signing up'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to pins_path, notice: 'You have successfully updated your profile'
    else
      render :edit
    end
  end

  def deactivate
    @user.inactive!
    logout
    redirect_to root_path, notice: 'You have successfully cancelled your account'
  end

  # def destroy
  #   @user.destroy
  #   redirect_to pins_path, notice: 'User was successfully destroyed.'
  # end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :image)
    end

end
