require 'spec_helper'

describe BookingSnapshotsController do

  describe 'GET index' do
    before(:each) do
      @new_shot = BookingSnapshot.create
      Booking.create(:name => 'Example', :metric_1 => 45123, :booking_snapshot_id => @new_shot.id)
      Booking.create(:name => 'Another', :metric_1 => 12345, :booking_snapshot_id => @new_shot.id)
      get :index
    end

    it 'returns a successful response' do
      response.should be_success
    end

    it 'renders the index page' do
      response.should render_template('booking_snapshots')
    end

    it 'returns the correct count of bookings for a given snapshot' do
      @new_shot.bookings.count.should == 2
    end

    # it 'updates the index page when another booking added' do
    #   b = Booking.all
    #   Booking.create(:name => 'YetAnother', :metric_1 => 67890, :booking_snapshot_id => 9)
    #   Booking.all.count.should == b.count + 1
    # end
  end
end
