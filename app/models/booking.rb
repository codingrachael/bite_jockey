class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :booker, class_name: 'User'

  # validates :description, :venue, :music_genre, :event_type, :date, :set_length, :hourly_rate, presence: true
  # validates :description, length: { minimum: 50 }, presence: true
  after_create :notify_user

  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?

  private

  def notify_user
    notification = BookingNotification.with(booking: self)
    notification.deliver(booking.user)
  end

end
