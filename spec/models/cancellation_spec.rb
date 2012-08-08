require 'spec_helper'
require 'yahoo_stock'

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

  describe 'initial instantiation' do
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

  describe 'updates cancellations table' do
    it 'updates name field' do
      c = Cancellation.new
      c.update_cancellations
      Cancellation.last.name.should == "Groupon, Inc."
    end

    it 'updates metric field' do
      c = Cancellation.new
      c.update_cancellations
      Cancellation.last.metric_1.should be_an_instance_of(Float)
    end
  end
end