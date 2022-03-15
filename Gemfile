source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "activerecord-session_store", "~> 2.0.0"
gem "administrate", "~> 0.17"
gem "bootsnap", ">= 1.4.2", require: false
gem "cable_ready", "~> 4.1"
gem "cssbundling-rails", "~> 1.1"
gem "delayed_job", "~> 4.1.9"
gem "delayed_job_active_record", "~> 4.1.5"
gem "hiredis", "~> 0.6.3"
gem "http_accept_language"
gem "jsbundling-rails", "~> 1.0"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.3"
gem "pundit", "~> 2.1"
gem "rails", "~> 7.0.0"
gem "redis", ">= 4.0", require: ["redis", "redis/connection/hiredis"]
gem "sentry-raven", "~> 3.1"
gem "sorcery", "~> 0.16"
gem "sprockets-rails", "~> 3.4.2"
gem "stimulus_reflex", "~> 3.4"
gem "view_component", "~> 2.50"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails", "~> 4.0.0"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "foreman"
  gem "guard-livereload", "~> 2.5", require: false
  gem "listen", "~> 3.2"
  gem "rack-livereload"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "database_cleaner-active_record"
  gem "rails-controller-testing"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "transactional_capybara"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
