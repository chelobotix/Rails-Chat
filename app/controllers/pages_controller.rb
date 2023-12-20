class PagesController < ApplicationController
  # Get -> Home
  def home
    @messages = Message.all
  end
end
