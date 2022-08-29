class AmenitiesController < ApplicationController
  def create
    @amenity = Amenity.new(amenity_params)
    authorize @amenity

    @amenity.save
    respond_to do |format|
      format.json
    end

  end

  private

  def amenity_params
    params.require(:amenity).permit(:name)
  end
end
