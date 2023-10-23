import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["input", "saveBtn"]
  static values = {
    access: Boolean
  }

  connect() {
    // Removes crayon next to editable fields according to access
    this.give_access()
  }

  give_access() {
    if (this.accessValue == false ) {
      this.inputTargets.forEach ((input) => {
        input.classList.remove("is-valid")
      })
    }
  }

  display_btn() {
    this.saveBtnTarget.classList.remove("d-none")
  }
}
