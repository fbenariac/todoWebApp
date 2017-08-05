# Application controller
class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # Global layout for app
  layout "application_two_cols"

  # Any routes that aren't defined above here go to the 404
  def routing_error
    render :file => 'public/404.html', :status => :not_found, :layout => false
  end

  # Session user tools' helper
  helper_method :current_user, :verify_logged_in

  private

    # return the session user ( or nil )
    def current_user
      @current_user ||= User.find( session[:user_id] ) if session[:user_id]
    end

    # Check is current_user else redirect to login page.
    def verify_logged_in
      ( !current_user && ENV['RAILS_ENV'] != 'test' ) ? redirect_to(login_path) : true
    end

end
