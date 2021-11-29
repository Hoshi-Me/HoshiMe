Rails.application.routes.draw do
  root to: 'static_pages#top'

  resurces :users, only: %i[new create]
end
