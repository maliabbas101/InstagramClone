# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :full_name, :username, :user_type, :password)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :current_password, :full_name, :username, :user_type)
    end
  end
end
