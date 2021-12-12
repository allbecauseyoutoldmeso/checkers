# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :game

  has_many(
    :cells,
    -> { order(:y, :x) },
    inverse_of: :board,
    dependent: :destroy
  )

  has_many :checkers, through: :cells

  accepts_nested_attributes_for :cells

  def rows
    cells.group_by(&:y).values
  end
end
