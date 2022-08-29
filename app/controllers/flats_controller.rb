class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]
  before_action :set_flat, only: %i[show edit update destroy]

  # home/landing page (a user can view all flats)
  # /
  def home
    @flats = policy_scope(Flat)

    # search bar
    if params[:query].present?
      sql_query = "name ILIKE :query OR location ILIKE :query"
      @flats = Flat.where(sql_query, query: "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  # a host can view host dashboard (index)
  # /flats
  def index
    @flats = policy_scope(Flat)
    authorize @flats
    @bookings = []
    @flats.each do |flat|
      @bookings << flat.bookings.load_target
    end
    @bookings.flatten!

    @bookings_new = @bookings.select { |booking| booking.end_date >= Date.today }
    @bookings_old = @bookings.select { |booking| booking.end_date < Date.today }

  end

  # a user can view a flat
  # /flats/:flat_id
  def show
    authorize @flat
    @booking = Booking.new
    @booking.user = current_user

    # for map
    @marker = @flat.attributes
    @markers = []
    @markers << @marker.select! { |key| key == "lat" || key == "lng" }

    # for calendar
    this_month = params.fetch(:start_date, Date.today).to_date
    next_month = params.fetch(:start_date, Date.today + 1.month).to_date
    @bookings = Booking.where(flat_id: @flat).where(payment_received: true).where(accepted: true)
  end

  # a host can create a flat
  # /flats/new
  def new
    @user = current_user
    @flat = Flat.new
    authorize @flat
  end

  # /flats/:id
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
  # /flats/:id/edit
  def edit
    @user = current_user
    @flat.user = current_user

    authorize @flat
  end

  # /flats/:id
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

  # a host can delete a flat (delete) DOESN'T WORK
  # /flats
  def destroy
    authorize @flat
    @flat.destroy
    redirect_to root_path, status: :see_other
  end

  # a host can update/reject a booking NOT DONE

  private

  def flat_params
    params.require(:flat).permit( :name, :location, :price, :num_occupants, :description, :num_bedroom, :num_bathroom, :avail_dates, photos: [], amenity_ids: [])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
