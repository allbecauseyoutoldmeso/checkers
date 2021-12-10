# frozen_string_literal: true

require 'rails_helper'

describe Board do
  describe '#rows' do
    it 'returns cells divided into rows' do
      game = GameFactory.new.create_game!

      rows = game.board.rows

      expect(rows.count).to eq(16)
    end
  end
end
