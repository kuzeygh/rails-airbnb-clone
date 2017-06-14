class EventsController < ApplicationController
  before_action :set_event, only:[:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @myevents = Attendance.where(user_id: current_user.id).map{ |attendance| attendance.event }

  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to events_path
  end

  def edit
  end

  def update
    @event.update(event_params)
    @event.save
    redirect_to events_path
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def book
    @event = Event.find(params[:event_id])
    @user = current_user
    Attendance.create(user_id: @user.id, event_id: @event.id)
    redirect_to event_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :event_time, :description, :category, :location, :user_id)
  end

end
