require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest

  test 'should get home' do
    get home_path
    assert_response :success
  end

  test 'should get login' do
    get '/login'
    assert_response :success
  end

  test 'should get logout' do
    get '/logout'
    assert_response 302
  end

  test 'should get a routing error' do
    get '/notFoundPage'
    assert_response 404
  end

end
