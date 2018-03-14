class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :sanitize_devise_parameters, if: :devise_controller?
    before_action :configure_permitted_parameters, if: :devise_controller?

  def sanitize_devise_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :postalcode])
  end

  def current_menu
      current_foodtrucker.menu
  end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password, :avatar])
    end


end
