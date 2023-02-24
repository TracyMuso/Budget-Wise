class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:splash]

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email password])
  end
end
