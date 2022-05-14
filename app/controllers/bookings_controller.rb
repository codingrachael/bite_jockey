class BookingsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(params[user_id])
    @booking.user = @user
    if @booking.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(@booking.user)
  end

  private

  def booking_params
    params.require(:booking).permit(:content)
  end

end
