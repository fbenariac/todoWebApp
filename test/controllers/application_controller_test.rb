require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  test 'should get home' do
    get '/home'
    assert_response :success
  end

  test 'should redirect to login' do
    get '/notFoundPage'
    assert_redirected_to new_user_session_path
  end

  test 'should get a routing error' do
    sign_in users(:one)
    get '/notFoundPage'
    assert_response 404
  end

  test 'get admin home' do

    get home_path
    assert_response :success

    # Sign In (and redirect)
    sign_in users(:one)
    post user_session_url, params: {
      user: {
        email:'test@test.com',
        password:'XXXX'
      }
    }

    assert_redirected_to logged_home_url

    # Sign out (and redirect)
    delete destroy_user_session_url
    assert_redirected_to home_url

  end

end
