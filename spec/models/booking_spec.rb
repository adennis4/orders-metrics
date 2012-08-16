require 'spec_helper'
require 'yahoo_stock'

describe Booking do

  let(:valid_params) do
    {
      :name => "Southwest",
      :metric_1 => 34,
      :booking_snapshot_id => 12
    }
  end

  describe 'associations' do
    it 'has one cancellation' do
      Booking.new.should respond_to(:cancellation)
    end

    it 'belongs to booking history' do
      Booking.new.should respond_to(:booking_history)
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
      Booking.new(valid_params.merge(:booking_snapshot_id => nil)).should_not be_valid
    end

    it 'booking id only has numeric values' do
      Booking.new(valid_params.merge(:booking_snapshot_id => 'adslf')).should_not be_valid
    end
  end

  describe 'update_bookings_table' do
    before :each do
      Booking.new.update_bookings
    end

    it 'updates bookings table name field' do
      Booking.last.should respond_to(:name)
    end

    it 'updates bookings table metric field' do
      Booking.last.should respond_to(:metric_1)
    end
  end
end
