class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def index
    @stat_array = Booking.find_all_by_name("Google Inc.").map { |order| order.metric_1 }
  
    @max = @stat_array.max
    @min = @stat_array.min
  end
end