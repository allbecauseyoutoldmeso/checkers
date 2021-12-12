import Rails from '@rails/ujs'
import { Controller } from 'stimulus'
import consumer from '../channels/consumer'

export default class extends Controller {
  static targets = ['form']

  connect() {
    this.channel = consumer.subscriptions.create('GameChannel', {
      received: this.cableReceived.bind(this),
    })
  }

  cableReceived(data) {
    this.formTarget.outerHTML = data.form
  }

  drag(event) {
    this.checker = event.target
    this.originCell = this.checker.parentElement
  }

  allowDrop(event) {
    event.preventDefault()
  }

  drop(event) {
    event.preventDefault()
    this.destinationCell = event.target
    this.destinationCell.appendChild(this.checker)
    this.updateInputs()
    this.submitForm()
  }

  updateInputs() {
    const originInput = this.originCell.getElementsByTagName('input')[0]
    const destinationInput = this.destinationCell.getElementsByTagName('input')[0]
    destinationInput.value = originInput.value
    originInput.value = null
  }

  submitForm() {
    const form = this.formTarget

    Rails.ajax({
      type: form.method,
      url: form.action,
      data: new FormData(form)
    })
  }
}
