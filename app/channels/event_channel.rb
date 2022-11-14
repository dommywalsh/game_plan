class EventChannel < ApplicationCable::Channel
  def subscribed
    event = Event.find(params[:event_id])
    stream_from "#{event.name} chatroom"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
