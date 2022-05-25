Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get 'connect', to: 'spotify_api#connect'

  get '/auth/spotify/callback', to: 'spotify_api#success'

  get 'playlists', to: 'spotify_api#playlists'

  get 'social', to: 'pages#social_home'

  get 'playlist-tracks', to: 'spotify_api#playlist_tracks'

  get 'playlist-harmonic', to: 'spotify_api#harmonic_sort'

  get 'social_index', to: 'pages#social_index'

  get 'test', to: 'pages#test_page'

  resources :users do
    resources :bookings, only: %i[new create index]
  end

  resources :bookings, only: %i[edit update destroy]

  resources :notifications, only: %i[index]


  # get "/users", to: "users#index"
  # get '/users/new', to: 'users#new'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # get '/users/:id/edit', to: 'users#edit'
  # patch '/users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
end
