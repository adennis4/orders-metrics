module LocationsModule

  def get_booking_locations
    booking_selection = Booking.select("fips_county_code county_code, count(*) count, created_at")
                               .group("fips_county_code")

    booking_selection.map do |booking|
      {"county_code" => booking.county_code,
       "count" => booking.count,
       "date_created" => booking.created_at.strftime("%s").to_i * 1000}
    end
  end

  def get_cancellation_locations
    cancellation_selection = Booking.select("fips_county_code county_code, count(*) count")
                                    .where("status = 'cancelled'")
                                    .group("fips_county_code")

    cancellation_selection.map do |cancellation|
      {"county_code" => cancellation.county_code,
       "count" => cancellation.count}
    end
  end
end