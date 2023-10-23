import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["form"]
  connect() {
  }

  toggle() {
    this.formTarget.classList.toggle("d-none")
  }
}
