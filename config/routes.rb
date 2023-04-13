# frozen_string_literal: true

require 'rswag/ui'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # devise for users
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
   controllers: {
     sessions: 'users/sessions',
     registrations: 'users/registrations'
   }

  namespace :api do
    namespace :v1 do
      resources :tours, only: [:index, :show, :destroy, :update, :create]
      get '/health', to: 'health#show'
    end
  end
end
