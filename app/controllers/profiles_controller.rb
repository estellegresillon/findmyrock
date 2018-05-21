class ProfilesController < ApplicationController
before_action :set_profile, only: [:show, :destroy]

  def show
    @band = Band.find(current_user)
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_path
    else
      render :new
    end
  end

  private

  def set_profile
    @booking = Booking.find(params[:id])
  end

end
