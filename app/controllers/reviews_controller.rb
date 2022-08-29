class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    authorize @review

    raise
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
