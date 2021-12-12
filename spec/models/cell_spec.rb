# frozen_string_literal: true

require 'rails_helper'

describe Cell do
  it 'has valid factory' do
    cell = create(:cell)
    expect(cell.valid?).to eq(true)
  end

  describe '#checker_id' do
    it 'returns checker id' do
      cell = create(:cell)
      checker = create(:checker, cell: cell)

      expect(cell.checker_id).to eq(checker.id)
    end
  end

  describe '#checker_id=' do
    it 'sets checker' do
      cell = create(:cell)
      checker = create(:checker)

      cell.checker_id = checker.id

      expect(cell.checker).to eq(checker)
    end
  end
end
