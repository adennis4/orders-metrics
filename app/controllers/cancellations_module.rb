module CancellationsModule

  def get_cancellations
    cancelled_bookings = Booking.find_all_by_status("cancelled")
    cancelled_hash = cancelled_bookings.group_by { |res| res.updated_at.to_date }
    {:cancelled_dates => list_of_dates(cancelled_hash), 
     :number_of_cancellations => cancellations_grouped_by_date(cancelled_hash)}
  end

  private

  def list_of_dates(cancellations)
    cancellations.keys
  end

  def cancellations_grouped_by_date(cancellations)
    cancellations.values.map{ |cancelled| cancelled.count }
  end
end