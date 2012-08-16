class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def index
    @bookings = Booking.find_all_by_name("Google Inc.").map { |order| order.metric_1 }
  
    @max = @bookings.max
    @min = @bookings.min
  end
end