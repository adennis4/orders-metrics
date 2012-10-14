module CancellationsModule
  extend self

  def get_cancellations
    cancelled_bookings = Booking.find_all_by_status("cancelled")
    cancelled_hash = cancelled_bookings.group_by { |res| res.updated_at.to_date }
    {:last_cancellation_date => list_of_dates(cancelled_hash),
     :last_date_count => cancellations_grouped_by_date(cancelled_hash)}
  end

  private

  def list_of_dates(cancellations)
    cancellations.keys.last
  end

  def cancellations_grouped_by_date(cancellations)
    cancellations.values.last.count
  end
end