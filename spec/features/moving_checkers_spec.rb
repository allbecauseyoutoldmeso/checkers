# frozen_string_literal: true

require 'rails_helper'

feature 'moving checkers', js: true do
  scenario 'player starts game and moves checker' do
    visit(root_path)
    click_button(I18n.t('games.new.create_game'))

    cell = page.all('.cell')[15]

    within(cell) do
      expect(page).not_to have_selector('.checker')
    end

    new_window = open_new_window

    within_window(new_window) do
      visit(edit_game_path(Game.last))

      cell_2 = page.all('.cell')[15]

      within(cell_2) do
        expect(page).not_to have_selector('.checker')
      end
    end

    checker = page.all('.checker')[6]
    checker.drag_to(cell)

    within(cell) do
      expect(page).to have_selector('.checker')
    end

    within_window(new_window) do
      cell_2 = page.all('.cell')[15]

      within(cell_2) do
        expect(page).not_to have_selector('.checker')
      end
    end

    visit(edit_game_path(Game.last))
    cell = page.all('.cell')[15]

    within(cell) do
      expect(page).to have_selector('.checker')
    end
  end
end
