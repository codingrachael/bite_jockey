class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

<<<<<<< HEAD
=======
  # Getting a weird error for this below. Commented out for now.
>>>>>>> 539daf008d451f56a5f7e74968ef37b056995c93
  # has_many :bookings, :playlists
  validates :first_name, :last_name, presence: true
end
