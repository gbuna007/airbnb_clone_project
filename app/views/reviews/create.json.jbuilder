if @review.persisted?
  json.form render(partial: "reviews/new", formats: :html, locals: {booking: @booking, review: Review.new})
  json.inserted_item render(partial: "bookings/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/new", formats: :html, locals: {booking: @booking, review: @review})
end
