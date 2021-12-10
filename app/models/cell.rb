# frozen_string_literal: true

class Cell < ApplicationRecord
  belongs_to :board
  has_one :checker, dependent: :destroy
end
