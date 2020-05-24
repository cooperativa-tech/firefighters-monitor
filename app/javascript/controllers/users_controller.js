import Controller from "./application_controller";
import StimusReflex from "stimulus_reflex";

export default class extends Controller {
  connect() {
    StimusReflex.register(this);

    window.addEventListener("users:update", this.handleUsersUpdate);
  }

  handleUsersUpdate = (event) => {
    if (event.detail.triggeredBy === this.currentUser) return;

    this.stimulate();
  };

  get currentUser() {
    return parseInt(this.data.get("current_user_id"));
  }
}
