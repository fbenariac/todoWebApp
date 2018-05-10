# Task controller
class TasksController < ApplicationController

  # Cancancan
#  load_and_authorize_resource

  # Devise
  before_action :authenticate_user!

  # paper_trail versionning: get user 'who done it'
  before_action :set_paper_trail_whodunnit

  # setter helper
  # before_action :init_task, only: %i[show edit update destroy]
  # before_action :init_tasks_list, only: :index

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(user_id: current_user.id).
                  order(order: 'ASC', due_date: 'DESC').all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = get_task_by_id params[:id]
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = get_task_by_id params[:id]
  end

  # POST /tasks
  # POST /tasks.json
  def create

    task = Task.new(task_params)
    set_user_id task

    respond_to do |format|
      if task.save

        format.html {
          redirect_to task, notice: 'Task was successfully created.'
        }

        format.json {
          render :show, status: :created, location: task
        }

      else

        format.html {
          render :new
        }

        format.json {
          render json: task.errors, status: :unprocessable_entity
        }

      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update

    task = get_task_by_id params[:id]

    respond_to do |format|

      if task.update(task_params)

        format.html {
          redirect_to task, notice: 'Task was successfully updated.'
        }

        format.json {
          render :show, status: :ok, location: task
        }

      else

        format.html {
          render :edit
        }

        format.json {
          render json: task.errors, status: :unprocessable_entity
        }

      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    task = get_task_by_id params[:id]
    task.destroy

    respond_to do |format|

      format.html {
        redirect_to tasks_url, notice: 'Task was successfully destroyed.'
      }

      format.json {
        head :no_content
      }

    end

  end

  private

    def get_task_by_id(id)
      Task.where(id: id).first
    end

    # Set task user_id
    def set_user_id(task)
      task.user_id ||= current_user.id
    end

    # Attr accessible list
    def task_attr
      %i[title description status order due_date user_id]
    end

    # Attr accessor
    def task_params
      params.require(:task).permit task_attr
    end

end
