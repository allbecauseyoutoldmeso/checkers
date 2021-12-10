# frozen_string_literal: true

require 'rails_helper'

describe GameFactory do
  describe '#create_game!' do
    it 'creates a game with a board, which has cells, which have checkers' do
      game = described_class.new.create_game!
      board = game.board

      expect(board).to be_a(Board)
      expect(board.cells.count).to eq(112)
      expect(board.cells.joins(:checker).count).to eq(60)
    end
  end
end
