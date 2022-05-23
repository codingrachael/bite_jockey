class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :playlists
  validates :first_name, :last_name, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_many_attached :image_url
end
