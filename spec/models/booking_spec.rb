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
end
