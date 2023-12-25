class PagesController < ApplicationController
  # Get -> Home
  def home
    @messages = Message.last_twenty_msgs
    @message = Message.new
  end
end
