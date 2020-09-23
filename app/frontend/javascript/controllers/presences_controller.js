import Controller from "./application_controller";

export default class extends Controller {
  connect() {
    super.connect();

    window.addEventListener("presences:update", this.handleUsersUpdate);
  }

  disconnect() {
    window.removeEventListener("presences:update", this.handleUsersUpdate);
  }

  handleUsersUpdate = (event) => {
    if (event.detail.triggeredBy === this.currentUser) return;

    this.stimulate();
  };

  toggleStatus = async (event) => {
    event.preventDefault();

    this.showLoadingSpinner();
    await this.stimulate("PresencesReflex#toggle_status", event.currentTarget);
    this.removeLoadingSpinner();
  };

  toggleDutyType = async (event) => {
    event.preventDefault();

    this.showLoadingSpinner();
    await this.stimulate(
      "PresencesReflex#toggle_duty_type",
      event.currentTarget
    );
    this.removeLoadingSpinner();
  };

  get currentUser() {
    return parseInt(this.data.get("current_user_id"), 10);
  }
}
