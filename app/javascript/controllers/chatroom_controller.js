import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="chatroom"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["comments"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    this.#scrollDown()
  }


  #insertMessageAndScrollDown(data) {
    this.commentsTarget.insertAdjacentHTML("beforeend", data)
    this.#scrollDown()
  }

  #scrollDown() {
    this.commentsTarget.parentNode.scrollTo(0, this.commentsTarget.parentNode.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

}
