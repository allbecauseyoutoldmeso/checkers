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
    game.update!(game_params)
    render(json: form_json)
    ActionCable.server.broadcast('game_channel', form_json)
  end

  private

  attr_reader :game

  def form_json
    {
      form: render_to_string(
        partial: 'form',
        locals: { game: game }
      )
    }
  end

  def assign_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(board_attributes: [:id, cells_attributes: {}])
  end
end
