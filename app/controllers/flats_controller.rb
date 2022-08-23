class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[show index]
  before_action :set_flat, only: [:show]

  def index
    @flats = Flat.all
  end

  def show
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
