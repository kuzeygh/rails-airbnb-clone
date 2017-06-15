class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_location
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :description])
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password" &&
      request.path != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath
    end
  end

end
