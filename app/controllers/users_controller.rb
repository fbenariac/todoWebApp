# Admin user controller
class UsersController < ApplicationController

  # Check if user is logged in
  before_action :verify_logged_in
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # List users. (Users admin home)
  def index
    @users = User.all.order( 'created_at DESC' )
  end

  # Display new user form
  def new
    @user = User.new
  end

  # Process the new user form.
  def create

    @user = User.new( user_params )

    if @user.save
      flash[:notice] = 'User Created'
      redirect_to users_path
    else
      render 'new'
    end

  end

  # Edit user form
  def edit
    @user = User.find params[:id]
  end

  # Process to edit user form
  def update

    @user = User.find params[:id]

    if @user.update user_params
      flash[:notice] = 'User Updated'
      redirect_to users_path
    else
      render 'edit'
    end

  end

  # Process to the delete action of a user.
  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:notice] = 'User Removed'
    redirect_to users_path
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_attr
      %i[username email password is_superuser is_admin]
    end

    # attributes accessor
    def user_params
      params.require(:user).permit user_attr
    end

end
