# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, controllers: { registrations: 'users/registrations' }

  # /api/v1/health
  namespace :api do
    namespace :v1 do
      get '/health', to: 'health#show'

      # tour
      get '/tours', to: 'tours#index'
      get 'tours/:id', to: 'tours#show'
      delete 'tours/:id', to: 'tours#destroy'
      patch 'tours/:id', to: 'tours#update'
      post 'tours', to: 'tours#create'
    end
  end
end
