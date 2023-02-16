ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

DatabaseCleaner[:mongoid].strategy = :deletion

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...

  setup do
    DatabaseCleaner.clean
  end

  teardown do
    DatabaseCleaner.clean
  end
end
