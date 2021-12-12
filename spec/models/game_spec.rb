# frozen_string_literal: true

require 'rails_helper'

describe Game do
  it 'has valid factory' do
    game = create(:game)
    expect(game.valid?).to eq(true)
  end
end
