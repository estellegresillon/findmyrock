class BookingsController < ApplicationController
before_action :booking_params, only: :create

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
    @booking = current_user.bookings
    @booking.destroy
    redirect_to profile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :price, :location, :band_id, :user_id)
  end

end
