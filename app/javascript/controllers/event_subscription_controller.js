import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="event-subscription"
export default class extends Controller {
  static targets = ["messages"];
  static values = {
    eventId: Number,
  };
  connect() {
    console.log(`Connecting to the ActionCable channel with id ${this.eventIdValue}`);

    createConsumer().subscriptions.create(
      { channel: "EventChannel", event_id: this.eventIdValue },
      { received: (data) => { this.#insertMessageAndScrollDown(data) } }
    )
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
