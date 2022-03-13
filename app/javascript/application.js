// Entry point for the build script in your package.json
require("./sentry");
require("@rails/ujs").start();
require("@hotwired/turbo-rails").Turbo.start();
require("@rails/activestorage").start();
require("./channels");
require("./controllers");
require("./datepicker");
require("./idleHandler");
