Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#show'

  get '/auth/spotify/callback', to: 'omniauth#spotify'

  resources :labels
  resources :playlists
end
