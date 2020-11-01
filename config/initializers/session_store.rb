Rails.application.config.cache_store = :redis_cache_store, {
  driver: :hiredis,
  url: ENV.fetch("REDIS_URL") { "redis://localhost:6379/1" }
}
Rails.application.config.session_store :active_record_store,
  serializer: :json,
  key: "_firefighters_monitor_session",
  same_site: :lax
