class SpotifyApiController < ApplicationController
  def connect
  end

  def success
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @hash = spotify_user.to_hash
  end

  def playlists
    spotify_user = RSpotify::User.new(params[:spotify_user])
    @playlists = spotify_user.playlists
  end
end
