class LocationsController < ApplicationController

  include BookingsModule, CancellationsModule, LocationsModule

  def index
    @title = params[:title]
    @locations = select_graph(@title)
    # @locations = get_locations
    # @title_hash = select_graph(params[:title])
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

  def get_booking_locations
    locations = Location.all
    locations.map do |location|
      { "state_abbr" => location.state,
        "count" => location.bookings.count}
    end
  end

  def get_cancellation_locations
    locations = Location.all
    locations.map do |location|
      { "state_abbr" => location.state,
        "count" => location.bookings.where(:status => "cancelled").count}
    end
  end
end
