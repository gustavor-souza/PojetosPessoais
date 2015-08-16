#controller da aplicação, determinados os parametros para usuários(devise)
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |user| user.permit(:name, :ddd, :phone , :email, :password, :password_confirmation, :avatar) }
    devise_parameter_sanitizer.for(:account_update) { |user| user.permit(:name, :ddd, :phone , :email, :password, :password_confirmatio, :current_password, :avatar) }
  end
end
