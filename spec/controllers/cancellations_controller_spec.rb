require 'spec_helper'

describe CancellationsController do

  describe 'GET index' do
    before(:each) do
      Cancellation.create(:name => 'Example', :metric_1 => 45123)
      Cancellation.create(:name => 'Another', :metric_1 => 12345)
      get :index
    end

    it 'returns a successful response' do
      response.should be_success
    end

    it 'renders the show page' do
      response.should render_template('cancellations/index')
    end

    it 'has a collection of the 2 created cancellations' do
      Cancellation.all.count.should == 2
    end

    it 'updates the index page when another cancellation added' do
      c = Cancellation.all
      Cancellation.create(:name => 'YetAnother', :metric_1 => 67890)
      Cancellation.all.count.should == c.count + 1
    end
  end
end
