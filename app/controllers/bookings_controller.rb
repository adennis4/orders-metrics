class BookingsController < ApplicationController

  include CancellationsModule
  include BookingsModule

  def new
    booking = Booking.new
  end

  def index
    @bookings_hash = get_bookings
    @title_hash = select_graph(params[:title])
  end

  private

  def select_graph(title)
    case title
    when "cancellations"
      get_cancellations
    when "weather"
      puts "weather is sunny"
    when "destination"
      puts "destination Bora Bora"
    when "location"
      puts "location nowhere"
    end
  end
end