Rails.application.routes.draw do
  root to: 'static_pages#top'

  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: %i[new create destroy]
  resources :items, only: %i[index new create edit update destroy] do
    get '/confirm', to: 'items#confirm', on: :collection
  end
  resources :calculations, only: %i[index]
  resource :profiles, only: %i[show edit update]
  resources :three_items, only: %i[new create]
end
