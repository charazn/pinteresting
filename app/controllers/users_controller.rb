class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :set_pins, only: [:create, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to pins_path, notice: 'Thank you for signing up.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'You have successfully updated your profile.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to pins_path, notice: 'User was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # def set_pins
    #   @pins = Pin.order('updated_at DESC')
    # end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
