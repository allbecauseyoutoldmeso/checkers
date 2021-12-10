# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :game
  has_many :cells, dependent: :destroy

  def rows
    cells.group_by(&:y).values
  end
end
