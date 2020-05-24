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

  toggleStatus = (event) => {
    event.preventDefault();

    this.stimulate("UsersReflex#toggle_status", event.currentTarget);
  };

  toggleDutyType = (event) => {
    event.preventDefault();

    this.stimulate("UsersReflex#toggle_duty_type", event.currentTarget);
  };

  get currentUser() {
    return parseInt(this.data.get("current_user_id"));
  }
}
