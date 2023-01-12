class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :email, :password, :password_confirmation]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password])
  end
end

# devise_parameter_sanitizer.permit(:sign_up) { |u|
# u.permit(:name, :surname, :email, :password, :password_confirmation) }
# devise_parameter_sanitizer.permit(:account_update) do |u|
#   u.permit(:email, :current_password)