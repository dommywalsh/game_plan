import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static values = { rating: Number }

  connect() {
    console.log('start')
    const counters = document.querySelectorAll('.counter-value');
    console.log("counters", counters.length)
    const speed = 500;

    counters.forEach( counter => {
       const animate = () => {
          const value = +counter.getAttribute('akhi');
          const data = +counter.querySelector("#rating").innerText;
          const time = value / speed;
         if(data < value) {
            counter.querySelector("#rating").innerText = Math.ceil(data + time);
            counter.querySelector("#first_name").innerText = Math.ceil(data + time);
            counter.querySelector("#second_name").innerText = Math.ceil(data + time);

            setTimeout(animate, 1);
          }else{
            const firstName = counter.getAttribute('first-name');
            const secondName = counter.getAttribute('second-name');

            debugger

            counter.querySelector("#rating").innerText = value;
            counter.querySelector("#first_name").innerText = firstName
            counter.querySelector("#second_name").innerText = secondName
          }

       }

       animate();
    });
  }
}
