# Application controller
class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # from Devise
#   before_action :authenticate_user!

  # Global layout for app
  layout "application_two_cols"

  # Any routes that aren't defined above here go to the 404
  def routing_error
    render :file => 'public/404.html', :status => :not_found, :layout => false
  end

  def home; end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end

  private
  
    # Overwriting the devise sign_out redirect path method
    # After log out user is redirect to home_path
    def after_sign_out_path_for(resource_or_scope)
      home_path
    end

    # Overwriting the sign_in redirect path method
    # After log in user is redirect to home_path
    def after_sign_in_path_for(resource_or_scope)
      # if current_user.admin?
      #   admin_logged_home_path
      # else 
        logged_home_path
      # end
    end
end
