// Entry point for the build script in your package.json
require("@rails/ujs").start();
require("@hotwired/turbo-rails").Turbo.start();
require("@rails/activestorage").start();
require("./application/channels");
require("./application/controllers");
require("./application/datepicker");
require("./application/idleHandler");
