class CreateSpotifyUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :spotify_users do |t|
      t.string :display_name
      t.string :email
      t.string :user_id

      t.timestamps
    end
  end
end
