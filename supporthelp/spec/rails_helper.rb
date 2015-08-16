# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.include Warden::Test::Helpers

  config.before :suite do
    Warden.test_mode!
  end

  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false

  config.infer_spec_type_from_file_location!

  config.include Capybara::DSL
end
