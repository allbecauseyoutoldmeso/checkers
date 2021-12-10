# frozen_string_literal: true

class GamesController < ApplicationController
  def new; end

  def create
    game = GameFactory.new.create_game!
    redirect_to(edit_game_path(game))
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    # ActionCable.server.broadcast('game_channel', { cell: game_params[:cell] })

    game = Game.find(params[:id])
    game.update!(game_params)
    redirect_to(edit_game_path(game))
  end

  private

  def game_params
    params.require(:game).permit(board_attributes: [:id, cells_attributes: {}])
  end
end
