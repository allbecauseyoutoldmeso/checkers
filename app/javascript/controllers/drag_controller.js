import Rails from '@rails/ujs'
import { Controller } from 'stimulus'
import consumer from '../channels/consumer'

export default class extends Controller {
  connect() {
    this.channel = consumer.subscriptions.create('GameChannel', {
      received: this.cableReceived.bind(this),
    })
  }

  cableReceived(data) {
    // update board
    // const cell = document.getElementById(data.cell)
    // cell.appendChild(this.checkerTarget)
  }

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

    // submit form
    // Rails.ajax({
    //   type: 'put',
    //   url: '/game',
    //   data: `game[cell]=${event.target.id}`
    // })
  }
}
