module BookingsHelper
  def bookings_ajax_previous_link
    ->(param, date_range) { link_to raw("&laquo;"), {param => date_range.first - 1.day}, remote: :true}
  end

  def bookings_ajax_next_link
    ->(param, date_range) { link_to raw("&raquo;"), {param => date_range.last + 1.day}, remote: :true}
  end
end
