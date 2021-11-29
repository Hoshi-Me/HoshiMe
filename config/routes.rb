Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :items, only: %i[index new create] do
    get '/confirm', to: 'items#confirm', on: :collection
  end
end
