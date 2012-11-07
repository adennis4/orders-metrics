module CancellationsModule
  extend self

  def get_cancellations
    cancelled_bookings = Booking.find_all_by_status("cancelled")
    cancelled_hash = cancelled_bookings.group_by { |res| res.updated_at.to_date }
    {:last_cancellation_date => last_cancelled_date(cancelled_hash),
     :last_date_count => cancellations_grouped_by_last_date(cancelled_hash)}
  end

  private

  def last_cancelled_date(cancellations)
    cancellations.keys.last
  end

  def cancellations_grouped_by_last_date(cancellations)
    cancellations.values.last.count
  end
end