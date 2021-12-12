# frozen_string_literal: true

FactoryBot.define do
  factory :checker do
    colour { 'yellow' }
    cell factory: :cell
  end
end
