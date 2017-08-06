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

end
