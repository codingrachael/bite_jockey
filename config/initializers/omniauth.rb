require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider
    :spotify, "9727e183cc694c2692b3621c7c9a7c57", "bcc1666d49b64282949ab4dc79e205fa",
    scope: 'user-read-email
            playlist-modify-public
            playlist-read-private
            playlist-modify-private
            user-library-read
            user-library-modify'
end

OmniAuth.config.allowed_request_methods = [:post, :get]
