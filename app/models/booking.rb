class Booking < ActiveRecord::Base
  attr_accessible :name, :status, :location_id, :ip_address, :fips_county_code

  belongs_to :location

  validates :name, :presence => true
  validates :status, :presence => true
  validates :ip_address, :presence => true,
                         :length => { :in => 7..15 }

  def self.add_booking(name, status, ip_address)
    new_booking = Booking.create(:name => name, :status => status, :ip_address => ip_address)
    set_location(new_booking)
  end

  def self.set_location(booking)
    booking.location_id = Location.set_county_code(booking.id)
    booking.fips_county_code = Location.find(booking.location_id).fips_county_code if booking.location_id
    booking.save
  end
end