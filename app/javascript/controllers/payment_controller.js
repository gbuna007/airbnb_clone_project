import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="payment"
export default class extends Controller {
  connect() {
    console.log("payment controller connected");
  }
}
