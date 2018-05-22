class ProfilesController < ApplicationController

  def show
    @bookings = current_user.bookings
   authorize :profile, :show?
  end

end
