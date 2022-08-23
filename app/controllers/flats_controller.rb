class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[show index]

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end
end
