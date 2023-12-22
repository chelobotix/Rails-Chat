class PagesController < ApplicationController
  # Get -> Home
  def home
    @messages = Message.all
    @message = Message.new
  end
end
