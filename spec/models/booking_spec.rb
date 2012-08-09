require 'spec_helper'
require 'yahoo_stock'

describe Booking do

  let(:valid_params) do
    {
      :name => "Southwest",
      :metric_1 => 34,
      :booking_history_id => 12
    }
  end

  describe 'associations' do
    it 'has one cancellation' do
      Booking.new.should respond_to(:cancellation)
    end
  end

  describe 'validations' do
    it 'requires a name' do
      Booking.new(valid_params.merge(:name => nil)).should_not be_valid
    end

    it 'requires a metric' do
      Booking.new(valid_params.merge(:metric_1 => nil)).should_not be_valid
    end

    it 'metric only has numeric values' do
      Booking.new(valid_params.merge(:metric_1 => "foo")).should_not be_valid
    end

    it 'requires a booking id' do
      Booking.new(valid_params.merge(:booking_history_id => nil)).should_not be_valid
    end

    it 'requires numeric values for booking id' do
      Booking.new(valid_params.merge(:booking_history_id => 'adslf')).should_not be_valid
    end
  end

  describe 'update_bookings_table' do
    it 'updates bookings table name field' do
      b = Booking.new
      b.update_bookings
      Booking.last.name.should == "Google Inc."
    end

    it 'updates bookings table metric field' do
      b = Booking.new
      b.update_bookings
      Booking.last.metric_1.should be_an_instance_of(Float)
    end
  end
end
