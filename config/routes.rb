Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

  get '/health', to: 'health#show'
end
