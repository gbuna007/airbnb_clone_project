class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit show payment payment_update update destroy accept_booking reject_booking]

  # a renter can view renter dashboard
  # /bookings
  def index
    @bookings = policy_scope(Booking)
    authorize @bookings

    @bookings_new = @bookings.select { |booking| booking.end_date >= Date.today }
    @bookings_old = @bookings.select { |booking| booking.end_date < Date.today }
  end

  # a renter can create a booking (booking confirmation page)
  # /bookings/new
  def new
    # @user = User.where(params[:user_id])
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
    authorize @booking
  end

  # /bookings/:id
  def create
    # checks if user is signed in or not
    @booking = Booking.new(booking_params)
    authorize @booking

    if user_signed_in?
      @booking.user = current_user

      @flat = Flat.find_by_id(params[:flat_id])
      @booking.flat = @flat

      # checks if form is filled in correctly
      if @booking.save
        redirect_to @booking, notice: "Booking created, please proceed with payment"
      else
        redirect_to flat_path(@flat), status: :unprocessable_entity, notice: "Please fill all required fields"
      end
    else
      redirect_to new_user_session_path
    end
  end

  # a renter can pay for a booking (payment page)
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

  # a renter can view a booking
  # /bookings/:id
  def show
    authorize @booking
    @booking.review.nil? ? @review = Review.new : @review = @booking.review
    @review.booking = @booking
  end

  # a renter can edit a booking
  # /bookings/:id/edit
  def edit
    authorize @booking
    @user = current_user
    @flat = @booking.flat

    this_month = params.fetch(:start_date, Date.today).to_date
    next_month = params.fetch(:start_date, Date.today + 1.month).to_date

    @bookings_this_month = Booking.where(start_date: this_month.beginning_of_month.beginning_of_week..this_month.end_of_month.end_of_week).where(flat_id: @flat).where(payment_received: true).where(accepted: true)

    @bookings_next_month = Booking.where(start_date: next_month.beginning_of_month.beginning_of_week..next_month.end_of_month.end_of_week).where(flat_id: @flat).where(payment_received: true).where(accepted: true)
  end

  # bookings/:id
  def update
    @booking.update(booking_params)

    authorize @booking

    if @booking.save
      redirect_to @booking
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def accept_booking
    authorize @booking

    @booking.update(accepted: true)
  end

  def reject_booking
    authorize @booking

    @booking.update(accepted: false)
  end

  # a renter can delete a booking
  # /bookings
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
