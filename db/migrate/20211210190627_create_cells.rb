# frozen_string_literal: true

class CreateCells < ActiveRecord::Migration[6.1]
  def change
    create_table :cells do |t|
      t.references :board
      t.integer :x
      t.integer :y
    end
  end
end
