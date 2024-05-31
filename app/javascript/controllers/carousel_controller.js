import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.isDown = false
    this.startX = 0
    this.scrollLeft = 0
    // Prevent default behavior on dragstart
    this.containerTarget.addEventListener("dragstart", (e) =>
      e.preventDefault()
    )
  }

  startDrag(event) {
    this.isDown = true
    this.startX = event.pageX - this.containerTarget.offsetLeft
    this.scrollLeft = this.containerTarget.scrollLeft
  }

  stopDrag() {
    this.isDown = false
  }

  drag(event) {
    if (!this.isDown) return
    event.preventDefault()
    const x = event.pageX - this.containerTarget.offsetLeft
    const walk = (x - this.startX) * 3 // Adjust scroll speed
    this.containerTarget.scrollLeft = this.scrollLeft - walk
  }

  get containerTarget() {
    return this.targets.find("container")
  }
}
