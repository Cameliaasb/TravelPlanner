import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="datepicker"
export default class extends Controller {

  static targets = ["start", "end"]


  connect() {
    console.log("hello")
    console.log(this.startTarget)
    console.log(this.endTarget)

    flatpickr(this.startTarget, {
      minDate: "today"
    })
    flatpickr(this.endTarget, {
      minDate: "today"
    })
  }
}
