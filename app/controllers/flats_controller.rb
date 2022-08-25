class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[show index]
  before_action :set_flat, only: [:show]

  def index
    @flats = policy_scope(Flat)
    @search = params[:name]
    if @search.present?
      @flats = Flat.where(name: @name)
    end
  end

  def show
    authorize @flat
    @booking = Booking.new
    @booking.user = current_user
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
