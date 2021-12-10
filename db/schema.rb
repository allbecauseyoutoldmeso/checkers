# frozen_string_literal: true

ActiveRecord::Schema.define(version: 2021_12_10_190637) do
  enable_extension 'plpgsql'

  create_table 'boards', force: :cascade do |t|
    t.bigint 'game_id'
    t.index ['game_id'], name: 'index_boards_on_game_id'
  end

  create_table 'cells', force: :cascade do |t|
    t.bigint 'board_id'
    t.integer 'x'
    t.integer 'y'
    t.index ['board_id'], name: 'index_cells_on_board_id'
  end

  create_table 'checkers', force: :cascade do |t|
    t.string 'colour'
    t.bigint 'cell_id'
    t.index ['cell_id'], name: 'index_checkers_on_cell_id'
  end

  create_table 'games', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
