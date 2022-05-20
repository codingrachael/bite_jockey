class Booking < ApplicationRecord
  belongs_to :User

  validates :description, :venue, :music_genre, :event_type, :date, :set_length, :hourly_rate, presence: true
  validates :description, length: { minimum: 50 }, presence: true


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
