require 'spec_helper'

describe CancellationsController do

  describe 'GET index' do
    before(:each) do
      Booking.create(:name => "Getaways", :status => "cancelled", :ip_address => '3.0.0.0')
    end

    it 'returns a successful response' do
      get :index
      response.should be_success
    end

    it 'renders the index page' do
      get :index
      response.should render_template('cancellations')
    end

    it 'knows the total number of cancelled reservations' do
      get :index
      Booking.where(:status => 'cancelled').count.should == 1
    end

    it 'knows the count of cancelled bookings when another is cancelled' do
      original_count = Booking.where(:status => 'cancelled').count
      Booking.create(:name => "Another", :status => 'cancelled', :ip_address => '3.0.0.0')
      get :index
      Booking.where(:status => 'cancelled').count.should == original_count + 1
    end
  end
end