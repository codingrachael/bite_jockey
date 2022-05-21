class PagesController < ApplicationController
  def home
  end

  def social_home
  end
  

  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
  
    # For a monthly view:
    @meetings = Meeting.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  
    # Or, for a weekly view:
      @meetings = Meeting.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
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
