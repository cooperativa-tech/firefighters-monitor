web: bundle exec puma -C config/puma.rb
sidekiq: bundle exec sidekiq -C config/sidekiq.yml
release: bundle exec rake db:migrate
delayed_job: bundle exec rake jobs:work
