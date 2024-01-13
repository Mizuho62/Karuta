class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.new
  end

  def create
      game = Game.new(games_params)
  
      game.user_id = current_user.id  

      if game.save
        redirect_to action: "index"
      else
        redirect_to action: "new"
      end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, notice:"削除しました"
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_parameter)
      redirect_to games_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def index
      @games = Game.all
  end

  def start_time
    self.start_at #self.の後はsimple_calendarに表示させるためのカラムを指定
  end


  
  
  def show
    @game = Game.find(params[:id])

    @comments = @game.comments
    @comment = Comment.new
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, notice:"削除しました"
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_parameter)
      redirect_to games_path, notice: "編集しました"
    else
      render 'edit'
    end
    @comments = @game.comments
    @comment = Comment.new

  end



  private
  def games_params
    params.require(:game).permit(:level, :hand, :result, :count, :about, :start_time, :title, :image) 
  end

end
