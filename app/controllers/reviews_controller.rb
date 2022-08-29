class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
    @booking = Booking.find(params:id)
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    authorize @review

    respond_to do |format|
      if @review.save
        format.html { redirect_to @booking }
        format.json
      else
        format.html { render "bookings/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
