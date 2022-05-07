class CreateSpotifyPlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :spotify_playlists do |t|
      t.references :spotify_user, null: false, foreign_key: true
      t.json :data
      t.string :spotify_id

      t.timestamps
    end
  end
end
