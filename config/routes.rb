Rails.application.routes.draw do
  root to: 'static_pages#top'

  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: %i[new create]
  resources :items, only: %i[index new create edit update] do
    get '/confirm', to: 'items#confirm', on: :collection
  end
end
