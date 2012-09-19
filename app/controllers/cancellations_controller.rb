class CancellationsController < ApplicationController

  include BookingsModule, CancellationsModule, LocationsModule

  def index
    @cancellations_hash = get_cancellations
    @title_hash = select_graph(params[:title])
  end

  private

  def select_graph(title)
    case title
    when "bookings"
      get_bookings
    when "weather"
      puts "weather is sunny"
    when "destination"
      puts "destination Bora Bora"
    when "location"
      get_locations
    end
  end
end
