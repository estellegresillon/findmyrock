class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @band = Band.find(params[:band_id])
    @review.band = @band
    authorize @review
    if @review.save
      redirect_to band_path(@band, anchor: "anchor-review")
    else
      @booking = Booking.new
      render "bands/show"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @band = @review.band
    @review.destroy
    redirect_to band_path(@band, anchor: "anchor-review")
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :band_id, :commenter)
  end

end
