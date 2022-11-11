class EventsController < ApplicationController
  def index
    @games = Game.all
    @event = Event.new
    @events = Event.all

    if params[:query].present?
      @events = Event.near(params[:query], 5)
    end

    if params[:gamefilter].present? && params[:gamefilter][:name]
      name = params[:gamefilter][:name]
      @game = Game.find_by(name: name)
      @events = Event.where(game: @game)
    end

    if params[:date_input].present?
      date_input = params[:date_input].split("to")
      start_date = date_input.first.to_datetime
      end_date = date_input.last.to_datetime
      @events = Event.where(date: start_date..end_date)
    end

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,

        info_window: render_to_string(partial: "info_window", locals: {event: event}),
        image_url: helpers.asset_url("Logo.png")


      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @player = Player.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def finish
    @event = Event.find(params[:id])
  end

  def submit_scores
    @event = Event.find(params[:id])
    @first_place = User.find_by(email: params[:first_place])
    @second_place = User.find_by(email: params[:second_place])
    @game = @event.game
    @first_place.user_ratings.find_by(game: @game).increment_first_place_score!
    @second_place.user_ratings.find_by(game: @game).increment_second_place_score!
    losing_users = @event.users.reject { |user| [@first_place, @second_place].include?(user) }
    losing_users.each do |user|
      user.user_ratings.find_by(game: @game).increment_losing_scores!
    end

    redirect_to leaderboard_game_path(@game)
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :latitude, :longitude, :description, :game_id)
  end
end
