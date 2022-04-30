class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD

  #has_many :bookings, :playlists
=======
  # has_many :bookings, :playlists
>>>>>>> 94498ab26f366c1667447c09c4f50538759f1667
  validates :first_name, :last_name, presence: true
end
