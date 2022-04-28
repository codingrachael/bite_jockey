class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Getting a weird error for this below. Commented out for now.
  # has_many :bookings, :playlists
  validates :first_name, :last_name, presence: true
end
