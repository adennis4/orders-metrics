require 'spec_helper'

describe Location do

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

  describe 'associations' do
    it 'has many bookings' do
      Location.new.should respond_to(:bookings)
    end
  end
end
