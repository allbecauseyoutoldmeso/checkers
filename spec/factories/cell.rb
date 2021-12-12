# frozen_string_literal: true

FactoryBot.define do
  factory :cell do
    x { 0 }
    y { 0 }
    board factory: :board
  end
end
