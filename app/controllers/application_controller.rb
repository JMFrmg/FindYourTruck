class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :sanitize_devise_parameters, if: :devise_controller?
    before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :essentials_variables

  def sanitize_devise_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :postalcode])
  end

  def current_menu
      current_foodtrucker.menu
  end

  def essentials_variables
    @foodtruckers = Foodtrucker.all
    @dish = Dish.all
  end

  def logged_in?
    !current_user.nil? || !current_foodtrucker.nil?
  end

  def admin_logged_in?
    !current_admin.nil?
  end

  def user_logged_in?
    !current_user.nil?
  end

  def foodtrucker_logged_in?
    !current_foodtrucker.nil?
  end

  def ensure_user_login
    return true if user_logged_in?
    session[:return_to] = request.fullpath
    redirect_to new_user_session_path and return false
  end

  def ensure_foodtrucker_login
    return true if (foodtrucker_logged_in? || admin_logged_in?)
    session[:return_to] = request.fullpath
    redirect_to new_foodtrucker_session_path and return false
  end

  def ensure_right_foodtrucker_logged
    return true if ((foodtrucker_logged_in? and (current_foodtrucker.id.to_s == params[:id])) || admin_logged_in?)
    session[:return_to] = request.fullpath
    redirect_to edit_foodtrucker_path(current_foodtrucker) and return false
  end


  def ensure_login
    return true if logged_in?
    session[:return_to] = request.fullpath
    redirect_to new_user_session_path and return false
  end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password, :avatar])
    end


end
