# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root 'assessment_request#request_assessment'
  # resources :assessment_request, only:%i[assessment_request]
  # get '/show/:id', to: 'user#show'
  # post '/show/:id',to: 'user#create'
  resources :assessments
end
