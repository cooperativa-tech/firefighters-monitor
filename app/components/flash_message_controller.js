import { Controller } from "stimulus";

export default class extends Controller {
  connect = () => {
    this.timeout = setTimeout(() => this.close(), 5000);
  };

  disconnect = () => {
    clearTimeout(this.timeout);
  };

  close = () => {
    this.element.remove();
  };
}
