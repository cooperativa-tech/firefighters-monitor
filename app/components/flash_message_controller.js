import { Controller } from "stimulus";

export default class extends Controller {
  connect = () => {
    this.timeout = setTimeout(() => this.close(), 2000);
  };

  disconnect = () => {
    clearTimeout(this.timeout);
  };

  close = () => {
    this.element.remove();
  };
}
