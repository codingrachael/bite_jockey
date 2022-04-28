class Booking < ApplicationRecord
  belongs_to :user

  validates :description, :venue, :music_genre, :event_type, :date, :set_length, :hourly_rate, presence: true
  validates :description, length: { min: 50 }, presence: true
end
