class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :length
      t.integer :song_count
      t.boolean :public
      t.date :date_created
      t.string :image
      t.jsonb :songs

      t.timestamps
    end
  end
end
