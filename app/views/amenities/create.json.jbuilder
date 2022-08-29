if @amenity.persisted?
  json.form render(partial: "amenities/form", formats: :html, locals: { amenity: Amenity.new })
  json.inserted_item render(partial: "flats/amenity", formats: :html, locals: { amenity: @amenity })
else
  json.form render(partial: "amenities/form", formats: :html, locals: { amenity: @amenity })
end
