import Rails from '@rails/ujs'
import { Controller } from 'stimulus'
import consumer from '../channels/consumer'

export default class extends Controller {
  static targets = ['checker']

  connect() {
    this.channel = consumer.subscriptions.create('GameChannel', {
      received: this.cableReceived.bind(this),
    })
  }

  cableReceived(data) {
    const cell = document.getElementById(data.cell)
    cell.appendChild(this.checkerTarget)
  }

  allowDrop(event) {
    event.preventDefault()
  }

  drop(event) {
    event.preventDefault()

    Rails.ajax({
      type: 'put',
      url: '/game',
      data: `game[cell]=${event.target.id}`
    })
  }
}
