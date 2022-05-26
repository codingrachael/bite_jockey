class UsersController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    @playlists = spotify_user.playlists
  end

  def index
    @users = User.all

    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(
          partial: 'info_window',
          locals: {
            user: user
          }
        ),
        image_url: helpers.asset_url("DJicon.png")
      }
    end
  end

  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
  end

  def new
    @user = User.new
    
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :location, :email, :password, :social_link, :image, :spotify_id, :pronoun, :description, :genres)
  end

end
