class Cancellation < ActiveRecord::Base
  attr_accessible :metric_1, :name

  def update_cancellations_table
  dummy_symbols = ['GRPN']
  dummy_symbols.each do |symbol|
    dummy_data = YahooStock::Quote.new(:stock_symbols => symbol)
    dummy_data.use_all_parameters
    dummy_data_hash = dummy_data.results(:to_hash).output.first

    c = Cancellation.new
    c[:name] = dummy_data_hash[:name]
    c[:metric_1] = dummy_data_hash[:last_trade_price_only]
    c.save!
    end 
  end  
end
