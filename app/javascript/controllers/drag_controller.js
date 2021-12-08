import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = []

  drag(event) {
    const checker = event.target
    event.dataTransfer.setData('checker', checker.id)
  }

  allowDrop(event) {
    event.preventDefault()
  }

  drop(event) {
    event.preventDefault()
    const data = event.dataTransfer.getData('checker')
    const checker = document.getElementById(data)
    const space = event.target
    space.appendChild(checker)
  }
}
