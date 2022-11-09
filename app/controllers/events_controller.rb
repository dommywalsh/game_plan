class EventsController < ApplicationController
  def index
    @events = Event.all

    if params[:query].present?
      @events = Event.search_by_game_and_date(params[:query])
    else
      @events = Event.all
    end

      @markers = @events.geocoded.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude,
          info_window: render_to_string(partial: "info_window", locals: { event: event }),
          image_url: helpers.asset_url("LogoGold.png")
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
