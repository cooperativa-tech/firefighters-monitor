source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 2.6"

gem "activerecord-session_store"
gem "administrate"
gem "bootsnap", ">= 1.4.2", require: false
gem "cable_ready", "~> 4.1"
gem "delayed_job"
gem "delayed_job_active_record"
gem "hiredis"
gem "http_accept_language"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.3"
gem "pundit"
gem "rails", "~> 6.0.3"
gem "redis", ">= 4.0", require: ["redis", "redis/connection/hiredis"]
gem "sass-rails", ">= 6"
gem "sorcery"
gem "stimulus_reflex", "~> 3.2"
gem "turbolinks", "~> 5"
gem "turbolinks_render"
gem "validates_timeliness"
gem "view_component"
gem "webpacker", "~> 5.1.1"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails", "~> 4.0.0"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
end

group :development do
  gem "foreman"
  gem "guard-livereload", "~> 2.5", require: false
  gem "listen", "~> 3.2"
  gem "rack-livereload"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
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
