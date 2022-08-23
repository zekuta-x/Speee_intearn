# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  resources :branches, only: %i[show]
  resources :assessments, only: %i[new create show]
end
