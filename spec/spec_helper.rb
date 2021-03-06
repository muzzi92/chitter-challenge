require 'simplecov'
require 'simplecov-console'
require './chitter_app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'

ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    require_relative './setup_test_database.rb'
    reset_database
  end
end

Capybara.app = ChitterApp
