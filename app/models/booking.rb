class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :booker, class_name: 'User'

  # validates :description, :venue, :music_genre, :event_type, :date, :set_length, :hourly_rate, presence: true
  # validates :description, length: { minimum: 50 }, presence: true
  after_create_commit :notify_user

  geocoded_by :venue
  after_validation :geocode, if: :will_save_change_to_venue?

  private

  def notify_user
    notification = BookingNotification.with(booking: self)
    notification.deliver(user)
  end

end
