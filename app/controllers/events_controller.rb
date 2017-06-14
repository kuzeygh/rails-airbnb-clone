class EventsController < ApplicationController
  before_action :set_event, only:[:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :book]

  def index
    # @category = params[:event][:category]
    # @events = Event.where(category: @category)
    # @myevents = Attendance.where(user_id: current_user.id).map{ |attendance| attendance.event }

    # @category = params[:event][:category]
    if params[:event].nil? || params[:event][:category].nil? || params[:event][:category] == ""
      @events = Event.all
    else
      @category = params[:event][:category]
      @events = Event.where(category: @category)
      # @myevents = Attendance.where(user_id: current_user.id).map{ |attendance| attendance.event }
    end

    # @events = Event.all
    # if current_user
    # @myevents = Attendance.where(user_id: current_user.id).map{ |attendance| attendance.event }
    # end


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
    flash[:notice] = "You have successfully booked this event"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :event_time, :description, :category, :location, :user_id, :photo, :photo_cache)
  end

  def require_login
    if !current_user
       flash[:alert] = "You need to log-in to do this action"
      redirect_to new_user_session_path
    end
  end

end
