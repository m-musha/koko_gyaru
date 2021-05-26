# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admins_genres_path
    else
      words_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    case resource_or_scope
    when :member
      root_path
    when :admin
      new_admin_session_path
    else
      root_path
    end
  end
end
