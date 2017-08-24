# Task controller
class TasksController < ApplicationController

  # Cancancan
  load_and_authorize_resource

  # Devise
  before_action :authenticate_user!

  # paper_trail versionning: get user 'who done it'
  before_action :set_paper_trail_whodunnit

  # setter helper
  before_action :set_task, only: %i[show edit update destroy]
  before_action :new_task, only: :new

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show; end

  # GET /tasks/new
  def new; end

  # GET /tasks/1/edit
  def edit; end

  # POST /tasks
  # POST /tasks.json
  def create

    # Call private helper method to set a new task
    set_user_id if new_task(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      # take the first task with the id we want and with the current user id (owner).
      @task = Task.where(id: params[:id]).where(user_id: current_user.id).first
      set_user_id if @task # Set user_id when AFTER @task is initialized
    end

    # Create new task obj
    def new_task(params=nil)
      @task = Task.new(params)
      set_user_id if @task # Set user_id when AFTER @task is initialized
    end

    # Set task user_id
    def set_user_id
      @task.user_id ||= current_user.id
    end

    # Attr accessible list
    def task_attr
      %i[title description completed order due_date]
    end

    # Attr accessor
    def task_params
      params.require(:task).permit task_attr
    end

end
