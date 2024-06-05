import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  disconnect() {
    this.element.remove()
  }

  open() {
    this.element.show()
    requestAnimationFrame(() => this.element.classList.add("open"))
  }

  close() {
    this.element.classList.remove("open")
    this.element.close()
  }
}
