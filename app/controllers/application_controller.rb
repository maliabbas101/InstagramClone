# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :full_name, :username, :user_type, :password, :avatar, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :current_password, :full_name, :username, :user_type, :avatar, :password_confirmation)
    end
  end

  private

  def user_not_authorized
    redirect_back(fallback_location: root_path, notice: 'You are not authorized to perform this action.')
  end

  def record_not_found
    redirect_to root_path, notice: 'Record not found.'
  end
end
