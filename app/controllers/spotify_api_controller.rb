class SpotifyApiController < ApplicationController

  def new
    @spotify_username = params[:username]
  end
end
