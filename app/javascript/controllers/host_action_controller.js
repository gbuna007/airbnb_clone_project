import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="host-action"
export default class extends Controller {
  static targets = ["status"]

  connect() {
    console.log("action stimulus on")
  }

  accept(event){
    event.preventDefault()

    console.log(event.currentTarget);
    this.statusTarget.innerText = "Booking Accepted";
  }

  reject(event){
    event.preventDefault()

    console.log(event.currentTarget);
    this.statusTarget.innerText = "Booking Rejected";
  }
}
