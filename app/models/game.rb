# frozen_string_literal: true

class Game < ApplicationRecord
  has_one :board, dependent: :destroy

  accepts_nested_attributes_for :board
end
