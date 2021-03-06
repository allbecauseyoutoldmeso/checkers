# frozen_string_literal: true

class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'game_channel'
  end

  def unsubscribed
    stop_all_streams
  end
end
