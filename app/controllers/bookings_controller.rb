class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show create payment payment_update]

  # a renter can see the renter dashboard
  # /bookings
  def index
    @bookings = policy_scope(Booking)
    @user = current_user
    # @bookings = Booking.all
  end

  # a renter can create a booking (booking confirmation page)
  # /bookings/:id SHOULD BE /NEW
  def new
    authorize @booking
    @booking = Booking.new
    @user = User.where(params[:user_id])
    @flat = Flat.where(params[:flat_id])
  end

  def create
    raise
    if user_signed_in?
      @booking = Booking.new(booking_params)
      authorize @booking

      @booking.user = current_user
      @flat = Flat.find_by_id(params[:flat_id])
      @booking.flat = @flat

      if @booking.save
        redirect_to @booking, notice: "Booking created, please proceed with payment"
      else
        redirect_to user_flat_path(current_user, @flat), status: :unprocessable_entity, notice: "Please fill all required fields"
      end
    else
      redirect_to new_user_session, status: :see_other
    end
  end

  # a renter can pay (payment page)
  # /bookings/:id/payment
  # takes you back to /bookings/:id after
  def payment
    authorize @booking
  end

  def payment_update
    authorize @booking
    @booking.update(payment_received: true)

    redirect_to @booking
  end

  # a renter can see a booking
  # /bookings/:id
  def show
    authorize @booking
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :num_guests, :flat_id, :payment_received)
  end
end
