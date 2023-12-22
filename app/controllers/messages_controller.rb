class MessagesController < ApplicationController
  before_action :require_user
  # post -> Create
  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast('marce_room_channel', { foo: message.body })
    else
      flash.now[:alert] = 'There was a problem, please try again later'
    end
  end

  private

  # message params
  def message_params
    params.require(:message).permit(:body)
  end
end
