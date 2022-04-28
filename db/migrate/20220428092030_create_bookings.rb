class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :venue
      t.integer :set_length
      t.float :hourly_rate
      t.string :music_genre
      t.string :event_type
      t.datetime :date

      t.timestamps
    end
  end
end
