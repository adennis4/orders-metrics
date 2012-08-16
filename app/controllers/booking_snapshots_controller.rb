class BookingSnapshotsController < ApplicationController
  
  def new
    @booking_snapshot = BookingSnapshot.new
  end

  def index
    @booking_snapshots = BookingSnapshot.all.map { |history| 
      history.bookings.count }
  end
end
