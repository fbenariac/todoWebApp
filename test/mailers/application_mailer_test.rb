
require 'test_helper'

class ApplicationMailerTest < ActionMailer::TestCase

  def setup
    setup_user
  end

  def setup_user
    @user ||= {
      email: 'test@domain.tld',
      username: 'username'
    }
  end

  test 'test application welcome mailer' do

    # Create the email and store it for further assertions
    email = ApplicationMailer.welcome_email(@user)

    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end

    # Test the body of the sent email contains what we expect it to
    assert_equal ['from@example.com'], email.from
    assert_equal [@user[:email]], email.to
    assert_equal 'Welcome', email.subject
    assert_equal "Welcome #{@user[:username]} !", email.body.to_s
  end
end
