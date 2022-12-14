class PlayersController < ApplicationController
  def create
    @player = Player.new
    @event = Event.find(params[:event_id])
    @player.event = @event
    @player.user = current_user
    if @player.save
      redirect_to event_path(@event), notice: "you have submmited a request to join this event"
    else
      redirect_to event_path(@event), notice: "counld not join"
    end
  end

  def accept
    @player = Player.find(params[:id])
    @player.status = "confirmed"
    @player.save
    redirect_to dashboard_path
  end

  def reject
    @player = Player.find(params[:id])
    @player.status = "rejected"
    @player.save
    redirect_to dashboard_path
  end
end
