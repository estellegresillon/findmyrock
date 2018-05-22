class ProfilesController < ApplicationController

  def show
    @booking = Booking.last
  end

end
