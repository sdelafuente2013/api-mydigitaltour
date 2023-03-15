# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

  namespace :api do
    namespace :v1 do
      get '/health', to: 'health#show'
    end
  end

end
