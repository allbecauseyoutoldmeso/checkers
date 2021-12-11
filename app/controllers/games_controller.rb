# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :assign_game, only: %i[edit update]
  def new; end

  def create
    game = GameFactory.new.create_game!
    redirect_to(edit_game_path(game))
  end

  def edit; end

  def update
    # ActionCable.server.broadcast('game_channel', { cell: game_params[:cell] })

    @game.update!(game_params)
    render(json: { game: render_to_string(:edit) })
  end

  private

  def assign_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(board_attributes: [:id, cells_attributes: {}])
  end
end
