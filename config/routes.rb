# frozen_string_literal: true

Rails.application.routes.draw do
  root "games#show"

  resource :game, only: :show
end
