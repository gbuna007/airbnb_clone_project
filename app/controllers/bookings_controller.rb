class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @user = User.where(params[:user_id])
  end
end
