Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get 'connect', to: 'spotify_api#connect'

  get '/auth/spotify/callback', to: 'spotify_api#success'

  get 'playlists', to: 'spotify_api#playlists'

  get 'social', to: 'pages#social_home'

  get 'playlist-tracks', to: 'spotify_api#playlist_tracks'

  resources :uers do
    resources :bookings, only: %i[new create edit update index show]
  end


  resources :bookings, only: %i[destroy]

  # get "/users", to: "users#index"
  # get '/users/new', to: 'users#new'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # get '/users/:id/edit', to: 'users#edit'
  # patch '/users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
end
