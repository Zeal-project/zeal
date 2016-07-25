class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_view_history

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name

    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  protected

  def set_view_history
    @view_history = ViewHistory.build_from_hash(session["my_view_history"])
  end
end
