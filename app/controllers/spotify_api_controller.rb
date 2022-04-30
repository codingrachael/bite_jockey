class SpotifyApiController < ApplicationController
  def connect
  end

  def success
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end

  def playlists
    raise
    spotify_user = params[:spotify_user]

    @playlists = spotify_user.playlists
  end
end
