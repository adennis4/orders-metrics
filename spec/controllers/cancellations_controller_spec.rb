require 'spec_helper'

describe CancellationsController do

  describe 'GET index' do

    it 'returns a successful response' do
      get :index
      response.should be_success
    end

    it 'renders the show page' do
      get :index
      response.should render_template('cancellations/index')
    end
  end
end
