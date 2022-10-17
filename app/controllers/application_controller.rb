class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      new_post_path(resource)
  end

  def after_sign_out_path_for(resource)
    tops_path
  end

    protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :introduction])
  end
end
