require 'spec_helper'

describe Location do

  describe 'associations' do
    it 'has many bookings' do
      Location.new.should respond_to(:bookings)
    end
  end

  describe 'validations' do
    describe 'fips_county_code' do
      it 'requires a fips_county_code' do
        Location.new(:fips_county_code => nil).should_not be_valid
      end

      it 'requires a length of 4 or 5 characters' do
        Location.new(:fips_county_code => 12345).should be_valid
        Location.new(:fips_county_code => 1234).should be_valid
      end

      it 'requires an integer as a value' do
        Location.new(:fips_county_code => "hello").should_not be_valid
      end

      it 'must be unique' do
        Location.create(:fips_county_code => 12345)
        Location.new(:fips_county_code => 12345).should_not be_valid
      end
    end
  end

  describe 'get geo information from ip address' do
    it 'retrieves location address using ip_address' do
      geo_loc = Location.get_location_from_ip_address('74.201.7.122')
      geo_loc.lat.should == 41.849998474121
      geo_loc.lng.should == -87.650001525879
    end

    it 'returns false if address is not successfully retrieved' do
      geo_loc = Location.get_location_from_ip_address('0.0.0.0')
      geo_loc.success == false
    end
  end

  describe 'get county code from api request' do
    it 'retrieves and formats an xml response' do
      response = Location.request_county_code(41.849998474121, -87.650001525879)
      response.should == 17031
    end

    it 'response is 0 if no location can be found' do
      response = Location.request_county_code(999, -999)
      response.should == 0
    end
  end

  describe 'set county code ' do
    it 'returns the county code on successful request' do
      Location.create(:fips_county_code => 17031)
      booking = Booking.create(:name => "Getaways", :status => "confirmed", :ip_address => "74.201.7.122")
      location_id = Location.set_county_code(booking.id)
      location_id.should == 1    
    end

    it 'returns nil and does not fail when county_code is 0' do
      booking = Booking.create(:name => "Getaways", :status => "confirmed", :ip_address => "0.0.0.0")
      county_code = Location.set_county_code(booking.id)
      county_code.should == nil
    end
  end
end
