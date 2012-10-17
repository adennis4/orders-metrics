class LocationsController < ApplicationController

  def index
    @title = params[:title]
    @locations = select_graph(@title)
  end


  private

  def select_graph(title)
    case title
    when "bookings"
      LocationsModule::get_booking_locations
    when "cancellations"
      LocationsModule::get_cancellation_locations
    end
  end
end
