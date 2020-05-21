source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "administrate"
gem "bootsnap", ">= 1.4.2", require: false
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.3"
gem "rails", "~> 6.0.3"
gem "sass-rails", ">= 6"
gem "sorcery"
gem "turbolinks", "~> 5"
gem "turbolinks_render"
gem "webpacker", "~> 5.1.1"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rubocop"
  gem "rubocop-rails"
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
