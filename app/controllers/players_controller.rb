class PlayersController < ApplicationController
  def create
    @player = Player.new
    @event = Event.find(params[:event_id])
    @player.event = @event
    @player.user = current_user

    if @player.save
      redirect_to event_path(@event), notice: "you have submmited a request to join this event"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update; end

end
