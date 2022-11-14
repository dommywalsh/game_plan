import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="event-subscription"
export default class extends Controller {
  static targets = ["messages"];
  static values = {
    eventId: Number,
  };
  connect() {
    console.log(
      `Connecting to the ActionCable channel with id ${this.eventIdValue}`
    );

    createConsumer().subscriptions.create(
      { channel: "EventChannel", event_id: this.eventIdValue },
      {
        received: (data) => {
          console.log("YOOOO");
          this.#insertMessageAndScrollDown(data);
        },
      }
    );
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data);
    console.log({
      scrollHeightElement: this.element.scrollHeight,
      scrollHeightMessages: this.messagesTarget.scrollHeight,
    });
    window.scrollTo(0, document.body.scrollHeight);
  }
}
