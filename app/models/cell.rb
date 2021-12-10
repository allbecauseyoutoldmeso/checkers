# frozen_string_literal: true

class Cell < ApplicationRecord
  belongs_to :board
  has_one :checker, dependent: :destroy

  def checker_id
    checker&.id
  end

  def checker_id=(id)
    self.checker = board.checkers.find(id) if id.present?
  end
end
