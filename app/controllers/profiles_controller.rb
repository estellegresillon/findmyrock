class ProfilesController < ApplicationController

  def show
    @booking = Booking.all
  end

end
