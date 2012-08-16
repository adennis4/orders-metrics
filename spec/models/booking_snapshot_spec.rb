require 'spec_helper'

describe BookingSnapshot do

  describe 'associations' do
    it 'has many bookings' do
      BookingSnapshot.new.should respond_to(:bookings)
    end
  end

  it 'counts the number of bookings per set time' do

  end

  it 'has a count of zero for a time set without bookings'
end
