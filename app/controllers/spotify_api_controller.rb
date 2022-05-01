class SpotifyApiController < ApplicationController
  def connect
  end

  def success
    spotify_user = RSpotify::User.new(request.env['omniauth.auth']).to_hash
    redirect_to playlists_path(spotify_user: spotify_user)
  end

  def playlists
    spotify_user = RSpotify::User.new(params[:spotify_user])
    @playlists = spotify_user.playlists
  end

  def playlist_tracks

  end
end
