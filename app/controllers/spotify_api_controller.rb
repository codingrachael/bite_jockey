require_relative '../../lib/camelot_keys'

class SpotifyApiController < ApplicationController
  BASE_URL = 'https://api.spotify.com/v1'

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
      new_track[:camelot] = camelot_wheel(new_track[:key].to_s.to_sym, new_track[:modality])
      new_track[:key_text] = CAMELOT_TO_TEXT[new_track[:camelot].to_s.to_sym]
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
    modality == 'Major' ? MAJOR_CAMELOT[key] : MINOR_CAMELOT[key]
  end
end
