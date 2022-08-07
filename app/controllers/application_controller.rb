class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    if resource["username"].nil?
      Device.update(current_device.id, is_active: true)
      "http://127.0.0.1:3000/welcome/index/"
    else
      "http://127.0.0.1:3000/devices"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
