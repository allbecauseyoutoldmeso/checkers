# frozen_string_literal: true

class Board
  include ActiveModel::Model

  def rows
    row_lengths.each_with_index.map do |length, y|
      length.times.map do |x|
        Cell.new(x: x, y: y)
      end
    end
  end

  private

  def row_lengths
    [1, 2, 3, 4, 13, 12, 11, 10, 10, 11, 12, 13, 4, 3, 2, 1]
  end
end
