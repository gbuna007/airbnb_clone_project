import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="payment"
export default class extends Controller {
  static values = {
    booking: Array,
  }

  connect() {
    console.log("payment controller connected");
  }

  paying() {
    event.preventDefault();
    console.log(this.bookingValue[0]['payment_received']);
  }


}
