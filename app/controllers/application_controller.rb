class ApplicationController < ActionController::Base
  helper_method :current_user
  around_action :set_time_zone

  def set_time_zone(&block)
    Time.use_zone('Asia/Bangkok', &block)
  end

  def after_sign_in_path_for(resource)
    dashboard_path 
  end
  
end
