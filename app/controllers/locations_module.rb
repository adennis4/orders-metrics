module LocationsModule

  def get_locations
    locations = Location.all
    locations.map do |location|
      { "state_abbr" => location.state,
        "booking_count" => location.bookings.count}
    end
  end
end