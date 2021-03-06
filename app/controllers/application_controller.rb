# Application controller
class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # from Devise
  before_action :authenticate_user!, except: :home

  # Global layout for app
  layout 'application_two_cols'

  # define CanCan module for application controller
  module CanCan; end

  # Login error rescue from CanCan
  rescue_from 'CanCan::AccessDenied', with: :login_error_handler

  # Any routes that aren't defined above here go to the 404
  def routing_error
    render file: 'public/404.html', status: :not_found, layout: false
  end

  # main application home
  def home; end

  private

    # Overwriting the devise sign_out redirect path method
    # After log out user is redirect to home_path
    def after_sign_out_path_for(resource_or_scope)
      home_path
    end

    # Overwriting the sign_in redirect path method
    # After log in user is redirect to home_path
    def after_sign_in_path_for(resource_or_scope)
      logged_home_path
    end

end
