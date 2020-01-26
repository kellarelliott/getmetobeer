class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me, :picture, :picture_cache, :remove_picture) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password, :picture, :picture_cache, :remove_picture) }
  end
end
