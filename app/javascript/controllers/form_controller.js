import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["input", "saveBtn"]
  static values = {
    owner: Boolean
  }

  connect() {
    // Removes crayon next to editable fields according to access
    this.owner_access()
  }

  owner_access() {
    if (this.ownerValue == false ) {
      this.inputTargets.forEach ((input) => {
        input.classList.remove("is-valid")
      })
    }
  }

  display_btn() {
    this.saveBtnTarget.classList.remove("d-none")
  }
}
