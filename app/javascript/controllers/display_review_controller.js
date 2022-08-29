import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-review"
export default class extends Controller {
  static targets = ["review", "form"]

  connect() {
    console.log("display connected");
  }

  update(event) {
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        this.reviewTarget.innerHTML = data.inserted_item
      })
  }
}
