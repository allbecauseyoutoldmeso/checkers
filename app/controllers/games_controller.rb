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
    ActionCable.server.broadcast('game_channel', { cell: game_params[:cell] })
    head :ok
  end

  private

  def game_params
    params.require(:game).permit(:cell)
  end
end
