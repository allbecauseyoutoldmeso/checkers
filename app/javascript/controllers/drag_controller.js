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
    // update board
  }

  drag(event) {
    const checker = event.target
    event.dataTransfer.setData('checkerId', checker.id)
    event.dataTransfer.setData('originCellId', checker.parentElement.id)
  }

  allowDrop(event) {
    event.preventDefault()
  }

  drop(event) {
    event.preventDefault()

    const checkerId = event.dataTransfer.getData('checkerId')
    const originCellId = event.dataTransfer.getData('originCellId')

    const checker = document.getElementById(checkerId)
    const originCell = document.getElementById(originCellId)
    const destinationCell = event.target

    destinationCell.appendChild(checker)

    const value = originCell.getElementsByTagName('input')[0].value
    destinationCell.getElementsByTagName('input')[0].value = value
    originCell.getElementsByTagName('input')[0].value = null

    const form = this.formTarget

    Rails.ajax({
      type: form.method,
      url: form.action,
      data: new FormData(form),
      success: (data) => {
        this.element.outerHTML = data.game
      }
    })
  }
}
