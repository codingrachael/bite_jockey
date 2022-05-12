class PagesController < ApplicationController
  def home
  end

  def social_home
  end

  def social_index
    #mock data
    @markers = [{
      lat: 37.8238,
      lng: 144.9913,
    }]
      # @users = User.all
      # # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      # @markers = @users.geocoded.map do |user|
      #   {
      #     lat: user.latitude,
      #     lng: user.longitude
        #  "info_window", locals: { flat: flat }),
        #  image_url: helpers.asset_url("DJicon.png")
      #   }
      # end
    end
end
