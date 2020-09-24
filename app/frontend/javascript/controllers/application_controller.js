import { Controller } from "stimulus";
import StimulusReflex from "stimulus_reflex";

export default class extends Controller {
  connect() {
    StimulusReflex.register(this);
  }

  showLoadingSpinner() {
    document.body.classList.add("wait");
  }

  removeLoadingSpinner() {
    document.body.classList.remove("wait");
  }
}
