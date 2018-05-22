class BandsController < ApplicationController
before_action :set_band, only: [:show, :update]

  def index
    # @bands = Band.all
    @bands = policy_scope(Band)
    @bands = Band.where.not(latitude: nil, longitude: nil)

    @markers = @bands.map do |b|
      {
        lat: b.latitude,
        lng: b.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def new
    @band = Band.new
    authorize @band
  end

  def create
    @band = Band.new(band_params)
    @band.user = current_user
    authorize @band
    if @band.save
      redirect_to band_path(@band)
    else
      render :new
    end
  end

  def show
    @review = Review.new
    @booking = Booking.new
  end

  def edit
    @band = current_user.band
    @band.user = current_user
    authorize @band
  end

  def update
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
    authorize @band
  end

  private

  def band_params
    params.require(:band).permit(:name, :description, :music_style, :number_of_musicians, :price_per_hour, :service_duration, :user_id, :photo)
  end

   def set_band
    @band = Band.find(params[:id])
    authorize @band
    end

end
