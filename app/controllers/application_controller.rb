class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
  end

  def authenticate_user
    if current_user.nil?
      flash[:error] = 'You must be signed in to view that page.'
      redirect_to new_user_session_path
    end
  end
end
