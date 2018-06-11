module ConcernDeviseWhitelist
  extend ActiveSupport::Concern

  # This will only run if it interacting with the devise controller
  included do
    before_action :configure_permitted_parameter, if: :devise_controller?
  end

  # This is specific to rails 5
  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end