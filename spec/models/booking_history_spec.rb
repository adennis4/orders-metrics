require 'spec_helper'

describe BookingHistory do

  describe 'validations' do
    it 'requires a booking id' do
      BookingHistory.new(:booking_id => nil).should_not be_valid
    end

    it 'requires numeric values for booking id' do
      BookingHistory.new(:booking_id => 'adslf').should_not be_valid
    end
  end

  describe 'associations' do
    it 'has many badges' do
      BookingHistory.new.should respond_to(:bookings)
    end
  end

  it 'counts the number of bookings per set time'
  it 'has a count of zero for a time set without bookings'
end
