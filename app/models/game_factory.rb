# frozen_string_literal: true

class GameFactory
  attr_reader :game

  def create_game!
    ActiveRecord::Base.transaction do
      @game = Game.create!
      @board = Board.create!(game: game)
      create_cells!
      create_checkers!
    end

    game
  end

  private

  attr_reader :board

  def create_checkers!
    checker_positions.each do |colour, coordinates|
      coordinates.each do |x, y|
        cell = board.cells.find_by(x: x, y: y)
        Checker.create!(cell: cell, colour: colour)
      end
    end
  end

  def create_cells!
    row_lengths.each_with_index do |length, y|
      length.times.map do |x|
        Cell.create!(x: x, y: y, board: board)
      end
    end
  end

  def row_lengths
    [1, 2, 3, 4, 13, 12, 11, 10, 9, 10, 11, 12, 13, 4, 3, 2, 1]
  end

  def checker_positions
    [
      [
        'green',
        [[0, 0], [0, 1], [0, 2], [0, 3], [1, 1], [1, 2], [1, 3], [2, 2], [2, 3], [3, 3]]
      ],
      [
        'yellow',
        [[0, 4], [0, 5], [0, 6], [0, 7], [1, 4], [1, 5], [1, 6], [2, 4], [2, 5], [3, 4]]
      ],
      [
        'red',
        [[0, 9], [0, 10], [0, 11], [0, 12], [1, 10], [1, 11], [1, 12], [2, 11], [2, 12], [3, 12]]
      ],
      [
        'blue',
        [[0, 13], [0, 14], [0, 15], [0, 16], [1, 13], [1, 14], [1, 15], [2, 13], [2, 14], [3, 13]]
      ],
      [
        'black',
        [[9, 4], [9, 5], [9, 6], [9, 7], [10, 4], [10, 5], [10, 6], [11, 4], [11, 5], [12, 4]]
      ],
      [
        'white',
        [[9, 9], [9, 10], [9, 11], [9, 12], [10, 10], [10, 11], [10, 12], [11, 11], [11, 12], [12, 12]]
      ]
    ]
  end
end
