import { Controller } from "@hotwired/stimulus"
import ConfettiGenerator from "confetti-js";

// Connects to data-controller="confetti"
export default class extends Controller {
  connect() {
    const confettiSettings = { target: 'confetti-canvas' };
    const confetti = new ConfettiGenerator(confettiSettings);
    confetti.render();
  }
}
