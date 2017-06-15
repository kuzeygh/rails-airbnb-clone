class PagesController < ApplicationController
  def home
    @user = User.new
    @event = Event.new
    @categories = Event.all.map {|event| event.category}
  end

  def index
    @user = current_user
    @myevents = Attendance.where(user_id: current_user.id).map { |attendance| attendance.event }
  end
end
