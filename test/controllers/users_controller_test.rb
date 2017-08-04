require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    sign_in_as users(:one)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do

    post users_url, params: {
      user: {
        username:	'Test',
        email:	'test@test.fr',
        password:	'test',
        password_confirmation:	'test',
        is_admin: false,
        is_superuser: false
      }
    }

    follow_redirect!
    assert_response :success

  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do

    patch user_url(@user), params: {
      user: {
        username: 'test'
      }
    }

    follow_redirect!
    assert_response :success

  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
