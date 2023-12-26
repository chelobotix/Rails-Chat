class ChatroomChannel < ApplicationCable::Channel
  # suscribed
  def subscribed
    stream_from('marce_room_channel')
  end

  # unsuscribed
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
