class ApplicationController < ActionController::Base
  helper_method :current_user

  def after_sign_in_path_for(resource)
    dashboard_path  # This will redirect to the dashboard after login
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    redirect_to login_path, alert: "You need to be logged in to access this page" unless current_user
  end
end
