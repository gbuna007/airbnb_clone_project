class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]
  before_action :set_flat, only: %i[show edit update destroy]

  # home/landing page (a user can see all flats)
  # /
  def home
    @search = params[:name]
    if @search.present?
      @flats = Flat.where(name: @name)
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
    @texts = %w[a b c d]

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
    @user = User.find(params[:user_id])
    @flat = Flat.new

    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    if @flat.save
      redirect_to user_flat_path(current_user, @flat)
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
    authorize @flat
    if @flat.save
      redirect_to user_flat_path(current_user, @flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to root_path
  end

  private

  def flat_params
    params.require(:flat).permit([:name, :location, :price, :num_occupants, :description, :num_bedroom, :num_bathroom, :amenitites, :avail_dates, photos: []])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
