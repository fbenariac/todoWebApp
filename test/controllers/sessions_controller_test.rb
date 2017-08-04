# require 'test_helper'
#
# class SessionsControllerTest < ActionDispatch::IntegrationTest
#
#   # test "should get new" do
#   #   get sessions_new_url
#   #   assert_response :success
#   # end
#
#   # test "should get create" do
#   #   get sessions_create_url
#   #   assert_response :success
#   # end
#
#   # test "should get destroy" do
#   #   get sessions_destroy_url
#   #   delete "/sessions/#{@session.id}"
#   #   assert_response :success
#   # end
#
# end

require "test_helper"

class SessionControllerTest < ActionDispatch::IntegrationTest

  test 'login session' do
    # get the login page
    get "/login"
    assert_equal 200, status

    # post the login and follow through to the home page
    post "/sessions", params: {
      username: 'john@doe.com',
      password: 'pswd'
    }

    #follow_redirect!
    assert_equal 200, status
  end

  test 'create session' do

    post "/sessions", params: {
      email: 'john@doe.com',
      password: 'pswd'
    }

    follow_redirect!
    assert_equal 200, status

  end

end
