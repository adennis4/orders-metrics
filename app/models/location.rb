class Location < ActiveRecord::Base
  attr_accessible :booking_id, :city, :country, :latitude, :longitude, :state

  belongs_to :booking

  def set_location(ip_address)
    params = ["city", "state", "country", "latitude", "longitude"]
    new_loc = Location.new
    loc_info = get_location_from_ip_address(ip_address)
    new_loc["city"] = loc_info.city
    new_loc["state"] = loc_info.state
    new_loc["country"] = loc_info.country_code
    new_loc["latitude"] = loc_info.lat
    new_loc["longitude"] = loc_info.lng
    new_loc.save
  end

  def get_location_from_ip_address(ip_address)
    Geokit::Geocoders::MultiGeocoder.geocode(ip_address)
  end
end
