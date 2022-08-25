class BookingsController < ApplicationController
  def new
    authorize @booking
    @booking = Booking.new
    @user = User.where(params[:user_id])
    @flat = Flat.where(params[:flat_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @flat = Flat.find_by_id(params[:flat_id])
    @booking.flat = @flat
    authorize @booking
    if @booking.save
      redirect_to root_path, notice: "Booking created, please proceed with payment"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :num_guests, :flat_id)
  end
end
