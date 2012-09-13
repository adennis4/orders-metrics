require 'spec_helper'

describe BookingsController do

  describe 'GET index' do
    before(:each) do
      Booking.create(:name => 'Getaways', :status => 'confirmed')
    end

    it 'returns a successful response' do
      get :index
      response.should be_success
    end

    it 'renders the index page' do
      get :index
      response.should render_template('bookings')
    end

    it 'knows the total number of confirmed bookings' do
      get :index
      Booking.all.count.should == 1
    end

    it 'increases the count of confirmed bookings when one is added' do
      original_count = Booking.all.count
      Booking.create(:name => "Another", :status => 'confirmed')
      get :index
      Booking.all.count.should == original_count + 1
    end
  end
end