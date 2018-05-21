class ProfilesController < ApplicationController
before_action :set_profile, only: [:show, :destroy]

  def show

  end

  private

  def set_profile
    @booking = Booking.find(params[:id])
  end

end
