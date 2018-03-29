class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only:[:edit, :show, :update, :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path, notice: t('flash.board.create')
    else
      render :new
    end
  end

  def show
    @comments = @board.comments.all
    @comment = @board.comments.build
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: t('flash.board.update')
    else
      render :edit
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:user_id, :title)
  end
end
