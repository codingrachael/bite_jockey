class SpotifyApiController < ApplicationController
  BASE_URL = 'https://api.spotify.com/v1'
  MAJOR_CAMELOT = {
    '0': '8B',
    '1': '3B',
    '2': '10B',
    '3': '5B',
    '4': '12B',
    '5': '7B',
    '6': '2B',
    '7': '9B',
    '8': '4B',
    '9': '11B',
    '10': '6B',
    '11': '1B'
  }
  MINOR_CAMELOT = {
    '0': '5A',
    '1': '12A',
    '2': '7A',
    '3': '2A',
    '4': '9A',
    '5': '4A',
    '6': '11A',
    '7': '6A',
    '8': '1A',
    '9': '8A',
    '10': '3A',
    '11': '10A'
  }

  def connect
  end

  def success
    spotify_user = RSpotify::User.new(request.env['omniauth.auth']).to_hash
    redirect_to playlists_path(spotify_user: spotify_user)
  end

  def playlists
    build_user
    @user_hash = @spotify_user.to_hash
  end

  def playlist_tracks
    build_user
    @playlist = @spotify_user.playlists.find { |playlist| playlist.id == user_params[:playlist_id] }
    @tracks = []
    @playlist.tracks.each do |track|
      audio_features = track.audio_features
      new_track = { name: track.name,
                    artist: track.artists.first.name,
                    album: track.album.name,
                    bpm: audio_features.tempo,
                    key: audio_features.key,
                    modality: audio_features.mode == 1 ? 'Major' : 'Minor',
                    danceability: audio_features.danceability,
                    energy: audio_features.energy }
      new_track[:camelot] = camelot_wheel
      @tracks << new_track
    end
    @tracks
    # auth = { "Authorization": "Bearer #{params[:token]}" }
    # @playlist = JSON.parse(RestClient.get("#{BASE_URL}/playlists/#{params[:playlist_id]}", auth))
    # raise
    # @tracks = @playlist['tracks']
  end

  private

  def build_user
    @spotify_user = RSpotify::User.new(user_params[:spotify_user])
  end

  def user_params
    params.permit!
  end

  def camelot_wheel(key, modality)
    if modality == 'Major'
      MAJOR_CAMELOT[key.to_s]
    else
      MINOR_CAMELOT[key.to_s]
    end
  end
end
