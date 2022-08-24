class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[show index]
  before_action :set_flat, only: [:show]

  def index
    @flats = policy_scope(Flat)
  end

  def show
    authorize @flat
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
