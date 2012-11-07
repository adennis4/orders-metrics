module BookingsModule
  extend self

  def get_bookings
    confirmed_bookings = Booking.find_all_by_status("confirmed")
    bookings_hash = confirmed_bookings.group_by { |res| res.created_at.to_date }
    {:last_booking_date => last_booked_date(bookings_hash),
     :last_date_count => bookings_grouped_by_last_date(bookings_hash)}
  end

  private

  def last_booked_date(bookings)
    bookings.keys.last
  end

  def bookings_grouped_by_last_date(bookings)
    bookings.values.last.count
  end
end