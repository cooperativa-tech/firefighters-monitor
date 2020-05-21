import { Controller } from "stimulus";
import buildUserChannel from "../channels/user_channel";

export default class extends Controller {
  static targets = ["status"];

  connect() {
    this.channel = buildUserChannel(this.userId, this.handleStatusUpdate);
  }

  toggleStatus = () => {
    this.channel.toggle(this.userId);
  };

  handleStatusUpdate = (data) => {
    const {
      user: { status },
    } = data;

    this.statusTarget.innerHTML = status;
  };

  get userId() {
    return parseInt(this.data.get("id"));
  }
}
