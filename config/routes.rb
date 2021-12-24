Rails.application.routes.draw do
  root to: 'static_pages#top'

  post 'guest', to: 'guest_sessions#create'

  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post 'oauth/callback',  to: 'oauths#callback'
  get  'oauth/callback',  to: 'oauths#callback'
  get  'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  resources :users, only: %i[new create destroy]
  resources :items, only: %i[index new create edit update destroy] do
    get '/confirm', to: 'items#confirm', on: :collection
  end
  resources :calculations, only: %i[index show]
  resource :profiles, only: %i[show edit update]
  resources :three_items, only: %i[new create]
end
