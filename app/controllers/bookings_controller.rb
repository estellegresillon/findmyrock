class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @band = Band.find(params[:band_id])
    @booking.band = @band
    @booking.user = current_user
    if @booking.save
      redirect_to "/profile"
    else
      render bands_path
    end
  end

  def destroy
    @booking.destroy
    redirect_to profile_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :price_per_hour, :location, :band_id, :user_id)
  end

end
