ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
<<<<<<< HEAD
require 'minitest/reporters'
=======
require "minitest/reporters"
>>>>>>> b6ee3c66f5110d2c526d8dced9350b18cf00c225
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all

  # Add more helper methods to be used by all tests here...
end
