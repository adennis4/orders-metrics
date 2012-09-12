class BookingsController < ApplicationController

  include CancellationsModule

  def new
    booking = Booking.new
  end

  def index
    confirmed_bookings = Booking.find_all_by_status("confirmed")
    bookings_hash = confirmed_bookings.group_by { |res| res.created_at.to_date }
    select_graph(params[:title])

    @booking_dates = list_of_dates(bookings_hash)
    @number_of_bookings = bookings_grouped_by_date(bookings_hash)
  end




  private

  def list_of_dates(confirmed_bookings)
    confirmed_bookings.keys
  end

  def bookings_grouped_by_date(confirmed_bookings)
    confirmed_bookings.values.first.count
  end

  def select_graph(title)
    case title
    when "cancellations"
      @cancellations_hash = get_cancellations
    when "weather"
      puts "weather is sunny"
    when "destination"
      puts "destination Bora Bora"
    when "location"
      puts "location nowhere"
    end
  end
end