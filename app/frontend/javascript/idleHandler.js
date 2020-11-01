import { Idle } from "idlejs";

// Refresh the page after 15 minutes of inactivity

new Idle()
  .whenNotInteractive()
  .within(15)
  .do(() => window.location.reload())
  .start();
