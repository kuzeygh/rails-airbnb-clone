class EventsController < ApplicationController
  before_action :set_event, only:[:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :book]

  def index
    # @category = params[:event][:category]
    # @events = Event.where(category: @category)
    # @myevents = Attendance.where(user_id: current_user.id).map{ |attendance| attendance.event }

    # @category = params[:event][:category]
    if params[:event].nil? || params[:event][:category].nil? || (params[:event][:category] == "" && params[:event][:city].blank?)
      @events = Event.all
    else
      @category = params[:event][:category]
      @city = params[:event][:city]
      unless @city.blank?
        if @category == ""
          @events = Event.where(city: @city)
        else
          @events = Event.where(category: @category, city: @city)
        end
      else
        @events = Event.where(category: @category)
      end
      # @myevents = Attendance.where(user_id: current_user.id).map{ |attendance| attendance.event }
    end


    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      if event.latitude
        marker.lat event.latitude
        marker.lng event.longitude
      else
        marker.lat '29.978'
        marker.lng '31.1320'
        # CHANGE!
      end
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

    # @events = Event.all
    # if current_user
    # @myevents = Attendance.where(user_id: current_user.id).map{ |attendance| attendance.event }
    # end

  end

  def show
    @alert_message = "You are viewing #{@event.name}"
    @event_coordinates = { lat: @event.latitude, lng: @event.longitude }

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new
    end
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

    if Attendance.exists?(user_id: @user.id, event_id: @event.id)
      redirect_to event_path(@event)
      flash[:alert] = "You have already booked"
       else Attendance.create(user_id: @user.id, event_id: @event.id)
    redirect_to event_path(@event)
    flash[:notice] = "You have successfully booked this event"
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :event_time, :description, :category, :location, :city, :user_id, :photo, :photo_cache)
  end

  def require_login
    if !current_user
       flash[:alert] = "You need to log-in to do this action"
      redirect_to new_user_session_path
    end
  end

end
