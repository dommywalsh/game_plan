import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="counter"
export default class extends Controller {
  static values = { rating: Number };

  connect() {
    const counters = document.querySelectorAll(".counter-value");
    const speed = 50;
    counters.forEach((counter) => {
      const animate = () => {
        const value = +counter.getAttribute("akhi");
        const data = +counter.querySelector("#rating").innerText;
        const time = value / speed;
        if (data < value) {
          counter.querySelector("#rating").innerText = Math.ceil(data + time);

          setTimeout(animate, 1);
        } else {
          counter.querySelector("#rating").innerText = value;
        }
      };

      animate();
    });
  }
}
