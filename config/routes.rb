Rails.application.routes.draw do
  root to: 'static_pages#top'

  resources :users, only: %i[new create]
  resources :items, only: %i[index new create edit update] do
    get '/confirm', to: 'items#confirm', on: :collection
  end
  resources :calculations, only: %i[index]
end
