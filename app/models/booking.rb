class Booking < ActiveRecord::Base
  attr_accessible :metric_1, :name

  def update_bookings_table
    dummy_symbols = ['GOOG']
    dummy_symbols.each do |symbol|
      dummy_data = YahooStock::Quote.new(:stock_symbols => symbol)
      dummy_data.use_all_parameters
      dummy_data_hash = dummy_data.results(:to_hash).output.first

      b = Booking.new
      b[:name] = dummy_data_hash[:name]
      b[:metric_1] = dummy_data_hash[:last_trade_price_only]
      b.save!
    end
  end
end
