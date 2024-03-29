# This file is copied to spec/ when you run 'rails generate rspec:install'
require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "database_cleaner/active_record"
require "capybara/rspec"
Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!

  require "transactional_capybara/rspec"
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.define_derived_metadata(file_path: Regexp.new("/spec/components/")) do |metadata|
    metadata[:type] = :component
  end

  config.include Sorcery::TestHelpers::Rails::Controller, type: :controller
  config.include AuthHelpers::Request, type: :request
  config.include AuthHelpers::Feature, type: :feature
  config.include TransactionalCapybara::AjaxHelpers, type: :feature
  config.include ViewComponent::TestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
