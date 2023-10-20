import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["input"]
  static values = {
    owner: Boolean
  }

  connect() {
    console.log("jy usis")
    console.log(this.inputTargets)
    console.log(this.ownerValue)
    this.handle()
  }

  // TO DO : why owner is always false?
  handle() {
    if (this.ownerValue == false ) {
      this.inputTargets.forEach ((input) => {
        input.classList.remove("is-valid")
        console.log(input)
      })
    }
}
}
