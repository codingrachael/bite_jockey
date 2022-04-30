Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get 'connect', to: 'spotify_api#connect'

  get '/auth/spotify/callback', to: 'users#spotify'
end
