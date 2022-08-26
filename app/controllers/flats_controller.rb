class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]
  before_action :set_flat, only: %i[show edit update destroy]

  # home/landing page (a user can see all flats)
  # /
  def home
    @flats = policy_scope(Flat)
    if params[:query].present?
      sql_query = "name ILIKE :query OR location ILIKE :query"
      @flats = Flat.where(sql_query, query: "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  # host dashboard
  def index
  end

  # a user can see a specific flat
  # /flats/:flat_id
  def show
    authorize @flat
    @booking = Booking.new
    @booking.user = current_user

    @marker = @flat.attributes
    @markers = []
    @markers << @marker.select! { |key| key == "lat" || key == "lng" }

    this_month = params.fetch(:start_date, Date.today).to_date
    next_month = params.fetch(:start_date, Date.today + 1.month).to_date

    @bookings_this_month = Booking.where(start_date: this_month.beginning_of_month.beginning_of_week..this_month.end_of_month.end_of_week).where(flat_id: @flat).where(payment_received: true).where(accepted: true)
    @bookings_next_month = Booking.where(start_date: next_month.beginning_of_month.beginning_of_week..next_month.end_of_month.end_of_week).where(flat_id: @flat).where(payment_received: true).where(accepted: true)
  end

  # a host can create a flat
  def new
    @user = current_user
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # a host can edit a flat
  def edit
    @user = current_user
    @flat.user = current_user

    authorize @flat
  end

  def update
    @flat.update(flat_params)
    @flat.user = current_user
    # raise
    authorize @flat
    @flat.save
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @flat
    @flat.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit( :name, :location, :price, :num_occupants, :description, :num_bedroom, :num_bathroom, :avail_dates, photos: [], amenity_ids: [])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
