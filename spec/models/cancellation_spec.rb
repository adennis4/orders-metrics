require 'spec_helper'

describe Cancellation do
  let(:valid_params) do
    {
      :name => "Southwest",
      :metric_1 => 34,
    }
  end

  describe 'associations' do
    it 'belongs to a booking' do
      Cancellation.new.should respond_to(:booking)
    end
  end

  describe 'validations' do
    it 'requires a name' do
      Cancellation.new(valid_params.merge(:name => nil)).should_not be_valid
    end

    it 'requires a metric' do
      Cancellation.new(valid_params.merge(:metric_1 => nil)).should_not be_valid
    end

    it 'metric only has numeric values' do
      Cancellation.new(valid_params.merge(:metric_1 => "foo")).should_not be_valid
    end
  end

  # describe 'updates cancellations table' do
  #   before :each do
  #     Cancellation.new.update_cancellations
  #   end

  #   it 'updates bookings table name field' do
  #     Cancellation.last.should respond_to(:name)
  #   end

  #   it 'updates bookings table metric field' do
  #     Cancellation.last.should respond_to(:metric_1)
  #   end
  # end
end