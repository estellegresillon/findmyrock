class ProfilesController < ApplicationController

  def show
    @user = current_user
    @band = current_user.band
    @booking = current_user.bookings
  end

end
