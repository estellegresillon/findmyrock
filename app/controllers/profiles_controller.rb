class ProfilesController < ApplicationController

  def show
    @bookings = current_user.bookings
    if current_user.band.present?
      @peoplewhobookedme = current_user.band.bookings
    else
      @peoplewhobookedme = []
    end
  end

end
