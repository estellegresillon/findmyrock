class BandsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_band, only: [:show, :update]

  def index
    @bands = policy_scope(Band).where.not(latitude: nil, longitude: nil)

    if params[:style].present? && params[:address].blank? && params[:budget].blank?
      @bands = @bands.where("music_style ILIKE ?", "%#{params[:style]}%")

    elsif params[:style].present? && params[:address].present? && params[:budget].blank?
      sql_query = " \
              music_style ILIKE :style \
            "
            @bands = @bands.where(sql_query, style: "%#{params[:style]}%").near(params[:address], 100)

    elsif params[:style].present? && params[:address].present? && params[:budget].present?
      sql_query = " \
              music_style ILIKE :style \
              AND price_per_hour < :budget \
            "
            @bands = @bands.where(sql_query, style: "%#{params[:style]}%", budget: params[:budget].to_i).near(params[:address], 100)

     elsif params[:style].blank? && params[:address].blank? && params[:budget].present?
      sql_query = " \
              price_per_hour < :budget \
            "
      @bands = @bands.where(sql_query, budget: params[:budget].to_i)

    elsif params[:style].present? && params[:address].blank? && params[:budget].present?
      sql_query = " \
              music_style ILIKE :style \
              AND  price_per_hour < :budget \
            "
            @bands = @bands.where(sql_query, style: "%#{params[:style]}%", budget: params[:budget].to_i)

    elsif params[:style].blank? && params[:address].present? && params[:budget].blank?
      @bands = @bands.near("#{params[:address]}", 10)

    elsif params[:style].blank? && params[:address].present? && params[:budget].present?
      sql_query = " \
              AND  price_per_hour < :budget \
            "
            @bands = @bands.where(sql_query, budget: params[:budget].to_i).near(params[:address], 10)
    end
     markers
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
    params.require(:band).permit(:name, :description, :address, :music_style, :number_of_musicians, :price_per_hour, :service_duration, :user_id, :photo)
  end

   def set_band
    @band = Band.find(params[:id])
    authorize @band
   end

   def markers
    @markers = @bands.map do |band|
      {
        lat: band.latitude,
        lng: band.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
      end
    end
end








