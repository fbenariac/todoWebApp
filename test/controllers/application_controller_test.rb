require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest

  test 'should get home' do
    get '/home'
    assert_response :success
  end

  test 'should get a routing error' do
    get '/notFoundPage'
    assert_response 404
  end

end
