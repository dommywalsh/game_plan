class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @games = Game.all
    @event = Event.new
    @events = Event.all
    if params[:query].present?
      # @events = Event.search_by_address(params[:query])
      @events = Event.near(params[:query], 5)
    end

    if params[:gamefilter].present? && params[:gamefilter][:name]
      name = params[:gamefilter][:name]
      @game = Game.find_by(name: name)
      @events = Event.where(game: @game)
    end

    if params[:start_date].present? && params[:end_date].present?
      start_date = params[:start_date].to_datetime
      end_date = params[:end_date].to_datetime
      @events = Event.where(date: start_date..end_date)
    end
  end

  def dashboard
    @events = current_user.events
    @first_pending_player = @events.find_first_pending_player
    @user = current_user
    # @users = @event.users.all
    # @pending_users = @event.users.pending
    # @ordered_ratings_array = UserRating.order_ratings
  end
end
