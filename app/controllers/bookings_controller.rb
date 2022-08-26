class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show payment]

  def index
    @bookings = policy_scope(Booking)
    @user = current_user
    # @bookings = Booking.all
    # authorize @bookings
  end

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
      redirect_to @booking, notice: "Booking created, please proceed with payment"
    end
  end

  def show
    authorize @booking
  end

  def payment
    authorize @booking
    @payment = @booking.payment_received
    @booking_attr_as_array = []
    @booking_attr_as_array << @booking.attributes
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :num_guests, :flat_id)
  end
end
