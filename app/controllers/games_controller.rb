# frozen_string_literal: true

class GamesController < ApplicationController
  def show
    @board = Board.new
  end

  def update
    ActionCable.server.broadcast('game_channel', { cell: game_params[:cell] })
    head :ok
  end

  private

  def game_params
    params.require(:game).permit(:cell)
  end
end
