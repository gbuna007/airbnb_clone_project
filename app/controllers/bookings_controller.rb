class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit show payment payment_update update destroy]

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
    authorize @booking
    @user = current_user
    @flat = @booking.flat

    this_month = params.fetch(:start_date, Date.today).to_date
    next_month = params.fetch(:start_date, Date.today + 1.month).to_date

    @bookings_this_month = Booking.where(start_date: this_month.beginning_of_month.beginning_of_week..this_month.end_of_month.end_of_week).where(flat_id: @flat).where(payment_received: true).where(accepted: true)

    @bookings_next_month = Booking.where(start_date: next_month.beginning_of_month.beginning_of_week..next_month.end_of_month.end_of_week).where(flat_id: @flat).where(payment_received: true).where(accepted: true)
  end

  def update
    @booking.update(booking_params)

    authorize @booking

    if @booking.save
      redirect_to @booking
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :num_guests, :flat_id, :payment_received)
  end
end
