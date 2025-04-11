class ApplicationController < ActionController::Base
  helper_method :current_user

  def after_sign_in_path_for(resource)
    dashboard_path  # This will redirect to the dashboard after login
  end
  
end
