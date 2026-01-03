class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user 
  # Log user activities
  def log_activity(action)

    user = current_user || (defined?(Current) ? Current.user : nil)

    # Debug line: this will show up in your terminal/server log
    Rails.logger.info "Attempting to log #{action} for user: #{user&.id}"
    
    return unless user
    
    # create! will throw an exception if validations fail
    UserActivity.create!(
      user: user,
      action: action,
      ip_address: request.remote_ip,
      user_agent: request.user_agent
    )
  rescue => e
    Rails.logger.error "Activity Log Failed: #{e.message}"
  end

  private 

  def current_user
    @current_user ||= begin
      if session[:user_id].present?
        User.find_by(id: session[:user_id])
      end
    end
  end

end
