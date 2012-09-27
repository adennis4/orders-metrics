require 'spec_helper'

describe Booking do

  let(:valid_params) do
    {
      :name => "Getaways",
      :status => "confirmed",
      :ip_address => "3.0.0.0"
    }
  end

  describe 'associations' do
    it 'has one affiliated location' do
      Booking.new.should respond_to(:location)
    end
  end

  describe 'validations' do
    it 'requires a name' do
      Booking.new(valid_params.merge(:name => nil)).should_not be_valid
    end

    it 'requires a status' do
      Booking.new(valid_params.merge(:status => nil)).should_not be_valid
    end

    it 'requires an ip_address' do
      Booking.new(valid_params.merge(:ip_address => nil)).should_not be_valid
    end

    it 'has an ip_address with length between 7 and 15' do
      Booking.new(valid_params.merge(:ip_address => "1.1.1")).should_not be_valid
      Booking.new(valid_params.merge(:ip_address => "123.123.123.123")).should be_valid
      Booking.new(valid_params.merge(:ip_address => "1234.1234.1234.1234")).should_not be_valid
    end
  end

  describe 'add_booking' do
    it 'creates a new entry in bookings table' do
      count = Booking.all.count
      Booking.add_booking("Getaways", "confirmed", "123.123.123.123")
      Booking.all.count.should == count + 1
    end

    it 'creates an entry even if location is not set' do
      count = Booking.all.count
      Booking.add_booking("Getaways", "confirmed", "0.0.0.0")
      Booking.all.count.should == count + 1
    end
  end

  describe 'set_location' do
    it 'sets a location_id for the booking' do
      Location.create(:fips_county_code => 17031)
      Booking.add_booking("Getaways", "confirmed", "74.201.7.122")
      Booking.last.location_id.should == 1
    end

    it 'does not fail even if ip_address is invalid' do
      Booking.add_booking("Getaways", "confirmed", "0.0.0.0")
      Booking.last.location_id.should == nil
    end
  end
end
