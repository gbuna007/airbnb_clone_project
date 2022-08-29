if @amenity.persisted?
  json.form render(partial: "amenitys/form", formats: :html, locals: {flat: @flat, amenity: Amenity.new})
  json.inserted_item render(partial: "flats/amenity", formats: :html, locals: {amenity: @amenity})
else
  json.form render(partial: "amenitys/form", formats: :html, locals: {flat: @flat, amenity: @review})
end
