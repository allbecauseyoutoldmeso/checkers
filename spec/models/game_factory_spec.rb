# frozen_string_literal: true

require 'rails_helper'

describe GameFactory do
  describe '#create_game!' do
    it 'creates game with board, with correct cells and checkers' do
      game = described_class.new.create_game!

      cells = game.board.cells

      expect(
        cells.map { |cell| [cell.x, cell.y] }
      ).to eq(
        [[0, 0], [0, 1], [1, 1], [0, 2], [1, 2], [2, 2], [0, 3], [1, 3], [2, 3], [3, 3], [0, 4], [1, 4], [2, 4], [3, 4], [4, 4], [5, 4], [6, 4], [7, 4], [8, 4], [9, 4], [10, 4], [11, 4], [12, 4], [0, 5], [1, 5], [2, 5], [3, 5], [4, 5], [5, 5], [6, 5], [7, 5], [8, 5], [9, 5], [10, 5], [11, 5], [0, 6], [1, 6], [2, 6], [3, 6], [4, 6], [5, 6], [6, 6], [7, 6], [8, 6], [9, 6], [10, 6], [0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 7], [8, 7], [9, 7], [0, 8], [1, 8], [2, 8], [3, 8], [4, 8], [5, 8], [6, 8], [7, 8], [8, 8], [0, 9], [1, 9], [2, 9], [3, 9], [4, 9], [5, 9], [6, 9], [7, 9], [8, 9], [9, 9], [0, 10], [1, 10], [2, 10], [3, 10], [4, 10], [5, 10], [6, 10], [7, 10], [8, 10], [9, 10], [10, 10], [0, 11], [1, 11], [2, 11], [3, 11], [4, 11], [5, 11], [6, 11], [7, 11], [8, 11], [9, 11], [10, 11], [11, 11], [0, 12], [1, 12], [2, 12], [3, 12], [4, 12], [5, 12], [6, 12], [7, 12], [8, 12], [9, 12], [10, 12], [11, 12], [12, 12], [0, 13], [1, 13], [2, 13], [3, 13], [0, 14], [1, 14], [2, 14], [0, 15], [1, 15], [0, 16]]
      )

      green_cells = cells.joins(:checker).where(checkers: { colour: 'green' })

      expect(
        green_cells.map { |cell| [cell.x, cell.y] }
      ).to eq(
        [[0, 0], [0, 1], [1, 1], [0, 2], [1, 2], [2, 2], [0, 3], [1, 3], [2, 3], [3, 3]]
      )

      blue_cells = cells.joins(:checker).where(checkers: { colour: 'blue' })

      expect(
        blue_cells.map { |cell| [cell.x, cell.y] }
      ).to eq(
        [[0, 13], [1, 13], [2, 13], [3, 13], [0, 14], [1, 14], [2, 14], [0, 15], [1, 15], [0, 16]]
      )

      red_cells = cells.joins(:checker).where(checkers: { colour: 'red' })

      expect(
        red_cells.map { |cell| [cell.x, cell.y] }
      ).to eq(
        [[0, 9], [0, 10], [1, 10], [0, 11], [1, 11], [2, 11], [0, 12], [1, 12], [2, 12], [3, 12]]
      )

      yellow_cells = cells.joins(:checker).where(checkers: { colour: 'yellow' })

      expect(
        yellow_cells.map { |cell| [cell.x, cell.y] }
      ).to eq(
        [[0, 4], [1, 4], [2, 4], [3, 4], [0, 5], [1, 5], [2, 5], [0, 6], [1, 6], [0, 7]]
      )

      black_cells = cells.joins(:checker).where(checkers: { colour: 'black' })

      expect(
        black_cells.map { |cell| [cell.x, cell.y] }
      ).to eq(
        [[9, 4], [10, 4], [11, 4], [12, 4], [9, 5], [10, 5], [11, 5], [9, 6], [10, 6], [9, 7]]
      )

      white_cells = cells.joins(:checker).where(checkers: { colour: 'white' })

      expect(
        white_cells.map { |cell| [cell.x, cell.y] }
      ).to eq(
        [[9, 9], [9, 10], [10, 10], [9, 11], [10, 11], [11, 11], [9, 12], [10, 12], [11, 12], [12, 12]]
      )
    end
  end
end
