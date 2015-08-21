class CommentsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_pin

  def new
    @comment = @pin.comments.build
  end

  def create
    @comment = @pin.comments.build(comment_params)
    @comment.commenter = current_user
    if @comment.save
      redirect_to @pin, notice: "Comment created successfully!"
    else
      render :new
    end
  end

  def edit
    @comment = @pin.comments.find(params[:id])
  end

  def update
    @comment = @pin.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to @pin, notice: "Comment updated successfully!"
    else
      render :edit
    end
  end

  private

    def set_pin
      @pin = Pin.find_by(id: params[:pin_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

end
