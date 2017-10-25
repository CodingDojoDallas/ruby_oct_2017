# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'factory_girl_rails'
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# This is set so that our testing database matches our development database after migrations. 
ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
			# Includes Factory Girl into our testing environment
	config.include FactoryGirl::Syntax::Methods
	
			#if you are using it:
	config.include CapybaraHelpers

	
			# This is set so that the test database is cleared after our tests are complete. 
	config.use_transactional_fixtures = true
	config.infer_spec_type_from_file_location!
	config.filter_rails_from_backtrace!
end