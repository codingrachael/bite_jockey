class BookingsController < ApplicationController
  before_action :find_booking, only: %i[index show edit update destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @user = User.find(params[user_id])
    @booking.user = current_user
    @booking.user = @user
    if @booking.save
      redirect_to user_path(@user)
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
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(@booking.user)
  end

  private

  def booking_params
    params.require(:booking).permit(:description, :venue, :set_length, :hourly_rate, :music_genre, :event_type, :date)
  end

  def find_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
