class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def not_authenticated
      redirect_to login_path, alert: "Please login first"
    end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :username
  #   devise_parameter_sanitizer.for(:account_update) << :username
  # end

end
