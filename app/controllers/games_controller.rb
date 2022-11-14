class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def leaderboard
    @game = Game.find(params[:id])
    @player_scores = @game.user_ratings.sort_by { |user| user[:rating] }.reverse
  end

  def leaderboards
    @games = Game.all
  end
end
