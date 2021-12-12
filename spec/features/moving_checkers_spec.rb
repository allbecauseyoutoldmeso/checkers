# frozen_string_literal: true

require 'rails_helper'

feature 'moving checkers', js: true do
  scenario 'player moves checker to empty space' do
    visit(root_path)
    click_button(I18n.t('games.new.create_game'))
    origin_cell = page.all('.cell')[6]
    checker = page.all('.checker')[6]
    checker_id = checker['id']
    target_cell = page.all('.cell')[15]

    within(origin_cell) do
      expect(page).to have_selector("##{checker_id}")
    end

    within(target_cell) do
      expect(page).not_to have_selector('.checker')
    end

    new_window = open_new_window

    within_window(new_window) do
      visit(edit_game_path(Game.last))
      origin_cell_2 = page.all('.cell')[6]
      target_cell_2 = page.all('.cell')[15]

      within(origin_cell_2) do
        expect(page).to have_selector("##{checker_id}")
      end

      within(target_cell_2) do
        expect(page).not_to have_selector('.checker')
      end
    end

    checker.drag_to(target_cell)

    within(origin_cell) do
      expect(page).not_to have_selector('.checker')
    end

    within(target_cell) do
      expect(page).to have_selector("##{checker_id}")
    end

    within_window(new_window) do
      sleep(2)
      origin_cell_2 = page.all('.cell')[6]
      target_cell_2 = page.all('.cell')[15]

      within(origin_cell_2) do
        expect(page).not_to have_selector('.checker')
      end

      within(target_cell_2) do
        expect(page).to have_selector("##{checker_id}")
      end
    end

    visit(edit_game_path(Game.last))
    origin_cell = page.all('.cell')[6]
    target_cell = page.all('.cell')[15]

    within(origin_cell) do
      expect(page).not_to have_selector('.checker')
    end

    within(target_cell) do
      expect(page).to have_selector('.checker')
    end
  end

  scenario 'player moves checker to space that has checker' do
    visit(root_path)
    click_button(I18n.t('games.new.create_game'))

    checker_1 = page.all('.checker')[6]
    checker_1_id = checker_1['id']
    cell_1 = page.all('.cell')[6]

    checker_2 = page.all('.checker')[7]
    checker_2_id = checker_2['id']
    cell_2 = page.all('.cell')[7]


    within(cell_1) do
      expect(page).to have_selector("##{checker_1_id}")
    end

    within(cell_2) do
      expect(page).to have_selector("##{checker_2_id}")
    end

    checker_1.drag_to(cell_2)

    within(cell_1) do
      expect(page).to have_selector("##{checker_1_id}")
    end

    within(cell_2) do
      expect(page).to have_selector("##{checker_2_id}")
    end
  end
end
