# frozen_string_literal: true

Rails.application.routes.draw do
  root 'games#new'

  resources :games, only: %i[new create edit update]
end
