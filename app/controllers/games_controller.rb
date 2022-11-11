class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def leaderboard
    @game = Game.find(params[:id])
  end

  def leaderboards
    @games = Game.all
    @number = 0
  end
end
