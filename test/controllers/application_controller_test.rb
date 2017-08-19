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

end
