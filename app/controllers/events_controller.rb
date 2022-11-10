class EventsController < ApplicationController
  def index


    # @question = Question.find(params[:question_id])
    # @answers = @question.answers
    # @answer = Answer.all
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

      @markers = @events.geocoded.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude,
          # info_window: render_to_string(partial: "info_window", locals: { event: event }),
          # image_url: helpers.asset_url("LogoGold.png")
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

  def edit; end

  def update; end

  def destroy; end

  private

  def event_params
    params.require(:event).permit(:name, :date, :latitude, :longitude, :description, :game_id)
  end
end