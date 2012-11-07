class Location < ActiveRecord::Base
  attr_accessible :county, :latitude, :longitude, :state, :fips_county_code

  has_many :bookings

  validates :fips_county_code, :presence => true,
                               :length => { :in => 4..5 },
                               :numericality => { :only_integer => true },
                               :uniqueness => true

  def self.get_location_from_ip_address(ip_address)
    Geokit::Geocoders::MultiGeocoder.geocode(ip_address)
  end

  def self.request_county_code(latitude, longitude)
    uri = URI("http://data.fcc.gov/api/block/find?latitude=#{latitude}&longitude=#{longitude}")
    xml_response = Net::HTTP.get(uri)
    xml_response.scan(/"(\d{5})\"/).flatten.first.to_i
  end

  def self.set_county_code(booking)
    geolocation = get_location_from_ip_address(booking.ip_address)
    latitude = geolocation.lat
    longitude = geolocation.lng
    county_code = request_county_code(latitude, longitude)

    location = Location.find_by_fips_county_code(county_code)
    if location
      location.state = geolocation.state
      location.latitude = latitude
      location.longitude = longitude
      location.save
    end

    county_code == 0 ? nil : location.id
  end
end
