require 'simplecov'
SimpleCov.start 'rails'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Active Support testCase config
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml
  #      for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Include devises helpers to Action controller TestCase
class ActionController::TestCase
  include Devise::Test::ControllerHelpers
end
