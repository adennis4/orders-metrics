require 'spec_helper'

describe BookingsController do

  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      response.should be_success
    end

    it 'renders the index page' do
      get :index
      response.should render_template('bookings')
    end

    describe 'find booking data grouped by date' do

      it 'gives a list of dates'

    end
  end
end