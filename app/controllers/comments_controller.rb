class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only:[:edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @board = @comment.board
    if @comment.save
      redirect_to board_path(@board), notice: t('flash.comment.create')
    else
      render 'boards/show'
    end
  end

  def edit
  end

  def update
    @board = @comment.board
    if @comment.update(comment_params)
      redirect_to board_path(@board), notice: t('flash.comment.update')
    else
      render :edit
    end
  end

  def destroy
    @board = @comment.board
    @comment.destroy
    redirect_to board_path(@board), notice: t('flash.comment.delete')
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:board_id, :user_name, :content)
  end
end
