class MessagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.event = @event
    @message.user = current_user

    raise
    if @message.save
      redirect_to event_messages_path(@event)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

private

  def message_params
    params.require(:message).permit(:content)
  end
end
