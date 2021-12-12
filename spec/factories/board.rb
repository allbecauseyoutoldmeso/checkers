# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    game factory: :game
  end
end
