class PinsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_pin, only: [:show, :upvote, :undo_upvote]
  before_action :correct_user, only: [:edit, :update, :archive]

  def index
    @pins = Pin.order('updated_at DESC').active.page(params[:page])
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created'
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated'
    else
      render :edit
    end
  end

  def archive
    # if @deal.try(:archived!)
    @pin.archived!
    redirect_to pins_path, notice: 'Pin was successfully deleted'
  end

  def upvote
    @pin.liked_by(current_user)
    redirect_to :back
  end

  def undo_upvote
    @pin.unliked_by(current_user)
    redirect_to :back
  end

  # def downvote
  #   @pin.disliked_by(current_user)
  #   redirect_to :back
  # end

  # def undo_downvote
  #   @pin.undisliked_by(current_user)
  #   redirect_to :back
  # end

  # def destroy
  #   @pin.destroy
  #   redirect_to pins_url, notice: 'Pin was successfully destroyed.'
  # end

  private

    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "You are not the author of this pin" if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:caption, :image)
    end

end
