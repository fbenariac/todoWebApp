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
