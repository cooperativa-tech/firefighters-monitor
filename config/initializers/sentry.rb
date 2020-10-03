Raven.configure do |config|
  config.dsn = "https://cb3f6cba3bf742cd8b1b6bbf88749053@o456594.ingest.sentry.io/5449816"
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
