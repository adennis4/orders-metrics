class LocationsController < ApplicationController

  include BookingsModule, CancellationsModule, LocationsModule

  def index
    @title = params[:title]
    @locations = select_graph(@title)
  end


  private

  def select_graph(title)
    case title
    when "bookings"
      get_booking_locations
    when "cancellations"
      get_cancellation_locations
    when "weather"
      puts "destination Bora Bora"
    when "destination"
      puts "holla"
    end
  end
end
