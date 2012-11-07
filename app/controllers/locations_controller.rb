class LocationsController < ApplicationController

  def index
    @title = params[:title]
    @locations = get_locations(@title)
  end


  private

  def get_locations(title)
    case title
    when "bookings"
      LocationsModule::get_booking_locations
    when "cancellations"
      LocationsModule::get_cancellation_locations
    end
  end
end
