class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.where(user_id: params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
    # authorize @booking
  end

  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @user = User.find(params[:user_id])
    @booking.user = @user
    @booking.booker = current_user
    # raise
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to user_bookings_path(current_user)
  end

  def destroy
    # @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_bookings_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:description, :venue, :set_length, :hourly_rate, :music_genre, :event_type, :date, :equipment_type)
  end

  def find_booking
    @booking = Booking.find(params[:id])
    # authorize @booking
  end
end
