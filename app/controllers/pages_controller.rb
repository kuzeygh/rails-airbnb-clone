class PagesController < ApplicationController
  def home
    @user = User.new
    @event = Event.new
    @categories = Event.all.map {|event| event.category}
  end
end
