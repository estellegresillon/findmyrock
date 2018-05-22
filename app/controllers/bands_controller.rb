class BandsController < ApplicationController
before_action :band_params, only: [:create, :update]

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    @band.user = current_user
    if @band.save
      redirect_to band_path(@band)
    else
      render :new
    end
  end

  def show
    @review = Review.new
    @band = Band.find(params[:id])
    @booking = Booking.new
  end

  def edit
    @band = current_user.band
    @band.user = current_user
  end

  def update
    @band = Band.find(params[:id])
    @band.user = current_user
    if @band.update(band_params)
      redirect_to profile_path, notice: "Band updated !"
    else
      render :edit
    end
  end

  def destroy
    @band = current_user.band
    @band.destroy
    redirect_to profile_path
  end

  private

  def band_params
    params.require(:band).permit(:name, :description, :music_style, :number_of_musicians, :price_per_hour, :service_duration, :user_id)
  end



end
