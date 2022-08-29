class AmenitiesController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @amenity = Review.new(amenity_params)
    @amenity.flat = @flat
    respond_to do |format|
      if @amenity.save
        format.html { redirect_to flat_path(@flat) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "flats/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
  end

  private

  def amendity_params
    params.require(:amenity).permit(:content)
  end
end
