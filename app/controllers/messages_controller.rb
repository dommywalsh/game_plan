class MessagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.event = @event
    @message.user = current_user

    if @message.save
      EventChannel.broadcast_to(
        @event,
        message: render_to_string(partial: "message",
          locals: { message: @message }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  def index
    @event = Event.find(params[:event_id])
    @messages = @event.messages
    @message = Message.new
  end
  
private

  def message_params
    params.require(:message).permit(:content)
  end
end
