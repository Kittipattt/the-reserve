class ApplicationController < ActionController::Base
  helper_method :current_user

  def after_sign_in_path_for(resource)
    dashboard_path 
  end
  
end
