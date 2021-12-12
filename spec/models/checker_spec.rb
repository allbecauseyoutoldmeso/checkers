# frozen_string_literal: true

require 'rails_helper'

describe Checker do
  it 'has valid factory' do
    checker = create(:checker)
    expect(checker.valid?).to eq(true)
  end
end
