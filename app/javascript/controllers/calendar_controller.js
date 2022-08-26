import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["start_date", "end_date"]

  connect() {
    console.log("cal controller connected")
  }

  select_date(event) {
    event.preventDefault();
    console.log(event.currentTarget);

    const date = event.currentTarget.firstElementChild.className
    console.log(date);

    if (this.start_dateTarget.value == "") {
      this.start_dateTarget.value = date
    } else {
      this.end_dateTarget.value = date;
    }
  }
}
