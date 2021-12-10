# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_10_190637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.bigint "game_id"
    t.index ["game_id"], name: "index_boards_on_game_id"
  end

  create_table "cells", force: :cascade do |t|
    t.bigint "board_id"
    t.integer "x"
    t.integer "y"
    t.index ["board_id"], name: "index_cells_on_board_id"
  end

  create_table "checkers", force: :cascade do |t|
    t.string "colour"
    t.bigint "cell_id"
    t.index ["cell_id"], name: "index_checkers_on_cell_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
