class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @band = Band.find(params[:band_id])
    @band.booking = @booking
    if @band.save
      redirect_to bands_path
    else
      render bands_path
    end
  end

end
