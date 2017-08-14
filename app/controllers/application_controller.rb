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

end
