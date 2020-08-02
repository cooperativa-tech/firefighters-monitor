import "@stimulus/polyfills";

// Stimulus Reflex workaround for IE11
if (window.NodeList && !NodeList.prototype.forEach) {
  NodeList.prototype.forEach = Array.prototype.forEach;
}

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("./application.css");
require("../javascript/channels");
require("../javascript/controllers");
require("../javascript/datepicker");
