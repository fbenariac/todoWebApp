# Auth Session controller
class SessionsController < ApplicationController

  # Display another layout for login form.
  layout 'login'
  
  # display login form
  def new
  end

  # Check login and set the user session if alright
  def create
    user = User.authenticate( params[:email], params[:password] )
    if user
      session[:user_id] = user.id
      redirect_to home_path, :notice => "Logged In"
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end
  end
  
  # logout (destroy user's session)
  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "Logged Out"  
  end
  
end