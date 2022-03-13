// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import StimulusReflex from "stimulus_reflex";
import consumer from "../channels/consumer";
import controller from "./application_controller";

const application = Application.start();
const context = require.context("./", true, /_controller\.js$/);
const componentsContext = require.context(
  "../../../components",
  true,
  /_controller\.js$/
);
const controllers = definitionsFromContext(context).concat(
  definitionsFromContext(componentsContext)
);
application.load(controllers);
StimulusReflex.initialize(application, { consumer, controller, debug: false });
