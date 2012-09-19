class LocationsController < ApplicationController

  def index
    @locations = get_locations
    @title_hash = select_graph(params[:title])  
  end


  private

  def select_graph(title)
    case title
    when "bookings"
      get_bookings
    when "cancellations"
      get_cancellations
    when "weather"
      puts "destination Bora Bora"
    when "destination"
      puts "holla"
    end
  end
end
