import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="buttonless-form"
export default class extends Controller {

  handleChange(event) {
    event.preventDefault();
    setTimeout(() => {
      event.target.form.requestSubmit();
    }, 500);
  }
}
