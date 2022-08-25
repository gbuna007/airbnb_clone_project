class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = policy_scope(Flat)
    @search = params[:name]
    if @search.present?
      @flats = Flat.where(name: @name)
    end
  end

  def show
    @booking = Booking.new
    @booking.user = current_user

    authorize @flat

  end

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
    params.require(:flat).permit(%i[name location price num_occupants num_bedroom num_bathroom amenitites avail_dates availability_status description])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
