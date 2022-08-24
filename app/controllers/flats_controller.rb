class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_flat, only: %i[show create]

  def index
    @flats = policy_scope(Flat)
    @search = params[:name]
    if @search.present?
      @flats = Flat.where(name: @name)
    end
  end

  def show
    authorize @flat
  end

  def new
    # @user = User.new
  end

  def create
    @flat = Flat.new(flat_params)
  end

  private

  def flat_params
    params.require(:flat).permit(%i[location price num_occupants num_bedroom num_bathroom amenitites avail_dates avaiability_status description])
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end
end
