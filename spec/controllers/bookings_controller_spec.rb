require 'spec_helper'

describe BookingsController do

  describe 'GET index' do
    before(:each) do
      Booking.create(:name => 'Example', :metric_1 => 45123)
      Booking.create(:name => 'Another', :metric_1 => 12345)
      get :index
    end

    it 'returns a successful response' do
      response.should be_success
    end

    it 'renders the index page' do
      response.should render_template('bookings/index')
    end

    it 'has a collection of the 2 created bookings' do
      Booking.all.count.should == 2
    end

    it 'updates the index page when another booking added' do
      b = Booking.all
      Booking.create(:name => 'YetAnother', :metric_1 => 67890)
      Booking.all.count.should == b.count + 1
    end
  end
end