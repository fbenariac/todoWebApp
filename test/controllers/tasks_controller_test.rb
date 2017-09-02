require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  def setup
    @task  = tasks(:one)
    @task_one_bis = tasks(:onebis)
    sign_in users(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should get new with user" do
    sign_in users(:two)

    get new_task_url
    assert_response :success
  end

  test "should create task" do

    post tasks_url, params: {
      task: {
        completed: @task.completed,
        description: @task.description,
        due_date: @task.due_date,
        order: @task.order,
        title: @task.title,
        user_id: users(:one).id
      }
    }

    assert_redirected_to task_url(Task.last)

    post tasks_url, params: {
      task: {
        completed: @task.completed,
        description: @task.description,
        due_date: @task.due_date,
        order: @task.order,
        title: ''
      }
    }

    assert :success

  end

  test "should show task" do
    get task_url(@task_one_bis)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task_one_bis)
    assert_response :success
  end

  test "should update task" do

    patch task_url(@task), params: {
      task: {
        completed: @task.completed,
        description: @task.description,
        due_date: @task.due_date,
        order: @task.order,
        title: @task.title
      }
    }

    assert_redirected_to task_url(@task)

    patch task_url(@task), params: {
      task: {
        title: ''
      }
    }

    assert :success

  end

  test "should destroy task" do
    delete "/tasks/#{@task.id}"
    assert_redirected_to tasks_url
  end

end
