FirefightersMonitor::Application.config.session_store :cookie_store, key: '_firefighters_monitor_session',
                                                       secure: Rails.env.production?,
                                                       same_site: :strict